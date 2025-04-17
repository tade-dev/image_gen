import 'dart:io';

class RequestParams {
  RequestParams({
    this.prompt,
    this.numberOfImages,
    this.img
  });

  final String? prompt;
  final int? numberOfImages;
  final File? img;

}
