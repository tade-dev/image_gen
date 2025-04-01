import 'dart:typed_data';
import 'package:app/core/api/exceptions.dart';
import 'package:app/core/api/success.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageDownloader {
  static Future<void> downloadMultipleImages(BuildContext context, List<String> imageUrls) async {
    try {
      if (await _requestPermission()) {

        await Future.wait(imageUrls.map((url) => _downloadAndSaveImage(url)));

        handleSuccess(message: "Image downloaded successfully!!!");
      } else {
        if(context.mounted){
          handleException("Failed to download image", context);
        }
      }
    } catch (e) {
      if(context.mounted){
        handleException("Error: ${e.toString()}", context);
      } 
    }
  }

  static Future<void> _downloadAndSaveImage(String imageUrl) async {
    try {
      var response = await Dio().get(imageUrl, options: Options(responseType: ResponseType.bytes));

      var result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      
      if (result['isSuccess']) {
        handleSuccess(message: "Image downloaded successfully!!!");
      } 

    } catch (e) {
      debugPrint("Error downloading $imageUrl: $e");
    }
  }

  static Future<bool> _requestPermission() async {
    var status = await Permission.storage.request();
    return status.isGranted;
  }
}