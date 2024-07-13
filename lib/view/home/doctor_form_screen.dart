// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayla_machine_test/model/doctor_model.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';
import 'package:kayla_machine_test/widgets/normal_widgets.dart';
import 'package:kayla_machine_test/widgets/snackbar_widget.dart';
import 'package:kayla_machine_test/controller/doctor_provider.dart';
import 'package:kayla_machine_test/view/home/widgets/form_widgets/form_fields.dart';

const double circleAvatarRadiusFraction = 0.18;

class DoctorFormScreen extends StatefulWidget {
  final Size size;
  final bool? isEdit;
  final DoctorModel? doctor;
  final DoctorProvider? docProvider;

  const DoctorFormScreen({
    super.key,
    this.isEdit,
    this.doctor,
    this.docProvider,
    required this.size,
  });

  @override
  State<DoctorFormScreen> createState() => _DoctorFormScreenState();
}

class _DoctorFormScreenState extends State<DoctorFormScreen> {
  TextEditingController fullNameEditController = TextEditingController();
  TextEditingController emailEditController = TextEditingController();
  TextEditingController phoneNumberEditController = TextEditingController();
  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    fullNameEditController.text = widget.doctor?.fullName ?? 'scs';
    emailEditController.text = widget.doctor?.email ?? '';
    phoneNumberEditController.text = widget.doctor?.phoneNumber ?? '';
    if (widget.doctor?.image != null) {
      _imageProvider = NetworkImage(widget.doctor?.image ?? '');
    } else {
      _imageProvider = const AssetImage('assets/avatar.png');
    }

    if (widget.isEdit == true) {
      widget.docProvider?.selectedGender = widget.doctor?.gender ?? 'Male';
      widget.docProvider?.selectedDistrict =
          widget.doctor?.district ?? 'Kozhikode';
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    double circleAvatarRadius =
        widget.size.shortestSide * circleAvatarRadiusFraction;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              doctorProvider.clearDoctorAddingControllers();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: widget.isEdit == true
            ? interHeadText(
                text: 'Edit Profile',
              )
            : interHeadText(
                text: 'Add Doctor',
              ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          if (widget.isEdit == true)
            IconButton(
              onPressed: () {
                confirmationDialog(
                  context,
                  widget.size,
                  confirmText: 'Delete',
                  onPressedConfirm: () async {
                    doctorProvider.deleteDoctor(
                      widget.doctor!.id!,
                    );
                    SnackBarWidget().showSuccessSnackbar(context,
                        'Dr. ${widget.doctor?.fullName ?? ''} is Deleted');
                    Navigator.pop(context);
                    Navigator.pop(context);
                    doctorProvider.getAllDoctors();
                  },
                  alertMessage:
                      'Confirm to delete the Dr. ${widget.doctor?.fullName ?? ''} ',
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: widget.size.height * .04),
                    Stack(
                      children: [
                        Consumer<DoctorProvider>(
                          builder: (context, value, child) => CircleAvatar(
                              radius: circleAvatarRadius,
                              backgroundColor: Colors.orange,
                              backgroundImage: value.profileImage != null
                                  ? Image.file(value.profileImage!).image
                                  : _imageProvider),
                        ),
                        Positioned(
                          bottom: 0,
                          right: widget.size.width * .05,
                          child: Container(
                            height: widget.size.height * .04,
                            width: widget.size.width * .08,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImage(context);
                              },
                              icon: const Icon(
                                EneftyIcons.edit_2_bold,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: widget.size.height * .02),
                    SizedBox(
                      height: widget.size.height * .45,
                      child: Form(
                          key: doctorProvider.doctorDetailsFormKey,
                          child: DoctorFormField(
                              isEdit: widget.isEdit,
                              fullNameEditingController: fullNameEditController,
                              emailEditingController: emailEditController,
                              phoneNumberEditingController:
                                  phoneNumberEditController,
                              doctorProvider: doctorProvider)),
                    ),
                    SizedBox(height: widget.size.height * .02),
                    SizedBox(
                      height: widget.size.height * .06,
                      width: widget.size.width * .9,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            const Color(0xFF019744),
                          ),
                        ),
                        onPressed: () async {
                          widget.isEdit == true
                              ? await updateDoctor(context, doctorProvider,
                                  docId: widget.doctor!.id)
                              : await addDoctor(context, doctorProvider);
                          doctorProvider.doctorDetailsFormKey.currentState!
                              .reset();
                          Navigator.pop(context);
                        },
                        child: widget.isEdit == true
                            ? poppinsText(
                                text: 'Update',
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFFFFFF),
                                fontSize: 16,
                              )
                            : poppinsText(
                                text: 'SAVE',
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFFFFFF),
                                fontSize: 16,
                              ),
                      ),
                    ),
                  ]),
            ),
          ),
          Consumer<DoctorProvider>(
            builder: (context, value, child) {
              return value.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'ADDING DOCTOR PLEASE WAIT... ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(BuildContext context) async {
    final authProvider = Provider.of<DoctorProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  authProvider.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  authProvider.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> addDoctor(context, DoctorProvider doctorProvider) async {
    final pickedImage = doctorProvider.profileImage;
    if (doctorProvider.phoneNumberController.text.length != 10) {
      // Display error message (you can replace this with your preferred way of showing errors)
      SnackBarWidget()
          .showErrorSnackbar(context, 'Phone number must be 10 digits');
      return; // Exit function if phone number is not valid
    }
    try {
      doctorProvider.setLoading(true);
      String? image;

      if (pickedImage != null) {
        image = await doctorProvider.uploadImage(
            File(pickedImage.path), doctorProvider.imageName);
      }

      final newDoctor = DoctorModel(
        image: image,
        gender: doctorProvider.selectedGender,
        district: doctorProvider.selectedDistrict,
        email: doctorProvider.emailController.text,
        fullName: doctorProvider.fullNameController.text,
        phoneNumber: doctorProvider.phoneNumberController.text,
      );

      await doctorProvider.addDoctor(newDoctor);
      doctorProvider.clearDoctorAddingControllers();
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Doctor Added Successfully');
    } catch (e) {
      SnackBarWidget()
          .showErrorSnackbar(context, 'Failed to add doctor, please try again');
    } finally {
      doctorProvider.setLoading(false);
    }
  }

  updateDoctor(context, DoctorProvider doctorProvider, {docId}) async {
    final pickedImage = doctorProvider.profileImage;
    try {
      doctorProvider.setLoading(true);
      String? image;

      if (pickedImage != null) {
        image = await doctorProvider.uploadImage(
            File(pickedImage.path), doctorProvider.imageName);
      } else {
        image = widget.doctor!.image;
      }

      final updateDoctor = DoctorModel(
        image: image,
        gender: doctorProvider.selectedGender,
        district: doctorProvider.selectedDistrict,
        email: emailEditController.text,
        fullName: fullNameEditController.text,
        phoneNumber: phoneNumberEditController.text,
      );

      await doctorProvider.updateDoctor(docId, updateDoctor);
      Navigator.pop(context);
      doctorProvider.clearDoctorAddingControllers();
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Doctor updated Successfully');
    } catch (e) {
      SnackBarWidget().showErrorSnackbar(
          context, 'Failed to update doctor, please try again');
    } finally {
      doctorProvider.setLoading(false);
    }
  }
}
