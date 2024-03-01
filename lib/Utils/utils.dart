import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Utils {
  void toastMessage(BuildContext context, String message,
      ContentType contentType, String toastTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: toastTitle,
          message: message,
          contentType: contentType,
        ),
      ),
    );
  }
}
