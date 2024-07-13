import 'package:flutter/material.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';

class SnackBarWidget {
  void showSuccessSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: poppinsText(
          text: message,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color(0xFF019744),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showErrorSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: poppinsText(
          text: message,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
