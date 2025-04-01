import 'package:app/core/di/injectable.dart';
import 'package:app/core/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void handleSuccess(
  {
    required String message,
  }
) {
  var context = si<AppRouter>().navigatorKey.currentContext;
  showTopSnackBar(
    Overlay.of(context!),
    CustomSnackBar.success(
      message: message,
    ),
  );
}