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
    if (imageUrls.isEmpty) {
      handleSuccess(message: "No images to download");
      return;
    }
    
    final GlobalKey<DownloadProgressDialogState> progressKey = GlobalKey<DownloadProgressDialogState>();
    
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return DownloadProgressDialog(
            key: progressKey,
            total: imageUrls.length,
          );
        },
      );
    }
    
    try {
      if (await _requestPermission()) {
        int completed = 0;
        
        for (var url in imageUrls) {
          try {
            await _downloadAndSaveImage(url);
            completed++;
            
            if (context.mounted && progressKey.currentState != null) {
              progressKey.currentState!.updateProgress(completed);
            }
          } catch (e) {
            debugPrint("Error downloading individual image $url: $e");
          }
        }
        
        await Future.delayed(const Duration(milliseconds: 300));
        if (context.mounted) {
          Navigator.of(context).pop();
          handleSuccess(message: "Images downloaded successfully!");
        }
      } else {
        if (context.mounted) {
          Navigator.of(context).pop();
          handleException("Permission denied", context);
        }
      }
    } catch (e) {
      debugPrint("General download error: $e");
      if (context.mounted) {
        Navigator.of(context).pop();
        handleException("Error: ${e.toString()}", context);
      }
    }
  }

  static Future<void> _downloadAndSaveImage(String imageUrl) async {
    try {
      var response = await Dio().get(
        imageUrl, 
        options: Options(
          responseType: ResponseType.bytes,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )
      );

      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
      );
      
      if (result == null || result['isSuccess'] != true) {
        debugPrint("Failed to save image to gallery: $imageUrl");
        throw Exception("Failed to save image");
      }
    } catch (e) {
      debugPrint("Error downloading $imageUrl: $e");
      rethrow;
    }
  }

  static Future<bool> _requestPermission() async {
    if (await Permission.photos.request().isGranted) {
      return true;
    }
    
    var status = await Permission.storage.request();
    return status.isGranted;
  }
}