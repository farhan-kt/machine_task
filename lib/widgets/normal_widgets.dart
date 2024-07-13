import 'package:flutter/material.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';

confirmationDialog(
  context,
  size, {
  elevatedButtonHeight,
  elevatedButtonWidth,
  height,
  width,
  dialogheight,
  dialogWidth,
  alertMessage,
  subText,
  required confirmText,
  onPressedConfirm,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: SizedBox(
          height: size.height * .12,
          width: dialogWidth,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height),
                poppinsText(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  text: alertMessage,
                  color: Colors.black,
                ),
                SizedBox(height: height),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: poppinsHeadText(
                          text: 'Back', color: const Color(0xFF1995AD))),
                  TextButton(
                    onPressed: onPressedConfirm,
                    child: poppinsHeadText(
                      text: confirmText,
                      color: Colors.red,
                    ),
                  ),
                ])
              ]),
        ));
      });
}
