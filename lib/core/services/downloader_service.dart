import 'dart:typed_data';
import 'package:app/core/api/exceptions.dart';
import 'package:app/core/api/success.dart';
import 'package:app/features/presentation/components/download_progress_indicator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageDownloader {
  static Future<void> downloadMultipleImages(BuildContext context, List<String> imageUrls) async {
    _showDownloadingDialog(context, imageUrls.length);
    
    try {
      if (await _requestPermission()) {
        int completed = 0;
        
        List<Future<void>> downloadFutures = imageUrls.map((url) async {
          await _downloadAndSaveImage(url);
          
          completed++;
          if (context.mounted) {
            _updateDownloadProgress(context, completed, imageUrls.length);
          }
        }).toList();
        
        await Future.wait(downloadFutures);
        
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        
        handleSuccess(message: "All images downloaded successfully!");
      } else {
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
          handleException("Permission denied", context);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        handleException("Error: ${e.toString()}", context);
      }
    }
  }

  static Future<void> _downloadAndSaveImage(String imageUrl) async {
    try {
      var response = await Dio().get(
        imageUrl, 
        options: Options(responseType: ResponseType.bytes)
      );

      var result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      
      if (!result['isSuccess']) {
        debugPrint("Failed to save image to gallery: $imageUrl");
      }
    } catch (e) {
      debugPrint("Error downloading $imageUrl: $e");
      rethrow;
    }
  }

  static Future<bool> _requestPermission() async {
    var status = await Permission.storage.request();
    return status.isGranted;
  }
  
  static void _showDownloadingDialog(BuildContext context, int totalImages) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DownloadProgressDialog(total: totalImages);
      },
    );
  }
  
  static void _updateDownloadProgress(BuildContext context, int completed, int total) {
    final DownloadProgressDialogState? progressDialog = 
        context.findAncestorStateOfType<DownloadProgressDialogState>();
    if (progressDialog != null) {
      progressDialog.updateProgress(completed);
    }
  }
}