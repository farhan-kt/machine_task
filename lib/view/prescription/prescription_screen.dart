import 'package:flutter/material.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: poppinsHeadText(
        text: 'NO PRESCRIPTION AVAILABLE',
        color: const Color(0xFF019744),
      )),
    );
  }
}
