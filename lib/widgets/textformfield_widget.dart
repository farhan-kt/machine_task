import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final String? suffixText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? validateMessage;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.suffixText,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.validateMessage,
    required this.controller,
  });

  static final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateMessage ?? 'Enter value';
        } else if (keyboardType == TextInputType.emailAddress &&
            !emailRegex.hasMatch(value)) {
          return 'Enter a valid email address';
        } else if (keyboardType == TextInputType.phone && value.length != 10) {
          return 'Enter 10 digits';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.inter(
          color: const Color(0xFF98A3B3),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        fillColor: const Color.fromARGB(255, 225, 227, 234),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

Widget dropDownTextFormField(
    {validateMessage, value, items, onChanged, hintText}) {
  return DropdownButtonFormField<String>(
    icon: const SizedBox.shrink(),
    validator: (value) {
      if (value == null) {
        return validateMessage;
      } else {
        return null;
      }
    },
    value: value,
    items: items,
    onChanged: onChanged,
    decoration: InputDecoration(
      suffixIcon: const Icon(EneftyIcons.arrow_down_outline),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 225, 227, 234),
      hintText: hintText,
      hintStyle: GoogleFonts.inter(
        color: const Color(0xFF98A3B3),
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    ),
  );
}

Widget homeDropDownButton({
  value,
  items,
  onChanged,
  hint,
}) {
  return DropdownButton<String>(
    value: value,
    items: items,
    onChanged: onChanged,
    hint: hint,
    underline: const SizedBox.shrink(),
  );
}
