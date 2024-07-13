// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kayla_machine_test/controller/doctor_provider.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';
import 'package:kayla_machine_test/widgets/textformfield_widget.dart';

class DoctorFormField extends StatelessWidget {
  final bool? isEdit;
  TextEditingController fullNameEditingController;
  TextEditingController emailEditingController;
  TextEditingController phoneNumberEditingController;
  final DoctorProvider doctorProvider;
  DoctorFormField(
      {super.key,
      required this.doctorProvider,
      required this.fullNameEditingController,
      required this.emailEditingController,
      required this.phoneNumberEditingController,
      this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      CustomTextFormField(
        controller: isEdit == true
            ? fullNameEditingController
            : doctorProvider.fullNameController,
        labelText: 'Full Name',
      ),
      dropDownTextFormField(
          hintText: 'District',
          value: doctorProvider.selectedDistrict,
          items: doctorProvider.district.map((district) {
            return DropdownMenuItem(
                value: district,
                child: interSubText(
                  text: district,
                ));
          }).toList(),
          onChanged: (value) {
            doctorProvider.selectedDistrict = value.toString();
          },
          validateMessage: 'select your gender'),
      CustomTextFormField(
        controller: isEdit == true
            ? emailEditingController
            : doctorProvider.emailController,
        keyboardType: TextInputType.emailAddress,
        hintText: 'Email',
      ),
      CustomTextFormField(
        controller: isEdit == true
            ? phoneNumberEditingController
            : doctorProvider.phoneNumberController,
        hintText: ' Phone Number',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.phone,
      ),
      dropDownTextFormField(
          hintText: 'Gender',
          value: doctorProvider.selectedGender,
          items: doctorProvider.genders.map((gender) {
            return DropdownMenuItem(
                value: gender,
                child: interSubText(
                  text: gender,
                ));
          }).toList(),
          onChanged: (value) {
            doctorProvider.selectedGender = value.toString();
          },
          validateMessage: 'select your gender'),
    ]);
  }
}
