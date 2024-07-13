import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayla_machine_test/model/doctor_model.dart';
import 'package:kayla_machine_test/service/doctor_service.dart';

class DoctorProvider extends ChangeNotifier {
  List<DoctorModel> allDoctorList = [];

  final doctorDetailsFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final DoctorService doctorService = DoctorService();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  String? selectedDistrict;
  List<String> district = ['Ernakulam', 'Kozhikode', 'Malappuram'];

  String? selectedHomeGender;
  List<String> homeGenders = ['Male', 'Female'];

  void setSelectedHomeGender(String? value) {
    selectedHomeGender = value;
    notifyListeners();
  }

  String? selectedHomeDistrict;
  List<String> homeDistrict = ['Ernakulam', 'Kozhikode', 'Malappuram'];

  void setSelectedHomeDistrict(String? value) {
    selectedHomeDistrict = value;
    notifyListeners();
  }

  void getAllDoctors() async {
    allDoctorList = await doctorService.getAllDoctors();
    notifyListeners();
  }

  Future<void> addDoctor(DoctorModel data) async {
    await doctorService.addDoctor(data);
    getAllDoctors();
    notifyListeners();
  }

  updateDoctor(docId, DoctorModel data) async {
    await doctorService.updateDoctor(docId, data);
    notifyListeners();
  }

  void deleteDoctor(
    String id,
  ) async {
    await doctorService.deleteDoctor(id);

    getAllDoctors();
  }

  void clearDoctorImage() {
    profileImage = null;
    notifyListeners();
  }

  void clearDropdownValues() {
    selectedGender = null;
    selectedDistrict = null;
    notifyListeners();
  }

  void clearDoctorAddingControllers() {
    emailController.clear();
    fullNameController.clear();
    phoneNumberController.clear();
    clearDoctorImage();
    clearDropdownValues();
  }

  File? profileImage;
  final ImagePicker imagePicker = ImagePicker();
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }

  Future<String> uploadImage(image, imageName) async {
    try {
      if (image != null) {
        String downloadUrl = await doctorService.uploadImage(imageName, image);
        log(downloadUrl);
        notifyListeners();
        return downloadUrl;
      } else {
        log('image is null');
        return '';
      }
    } catch (e) {
      log('got an error of $e');
      rethrow;
    }
  }
}
