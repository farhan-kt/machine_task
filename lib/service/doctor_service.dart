import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kayla_machine_test/model/doctor_model.dart';

class DoctorService {
  Reference storage = FirebaseStorage.instance.ref();

  String doctors = 'doctor';
  late CollectionReference<DoctorModel> doctor;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  DoctorService() {
    doctor = firebaseFirestore.collection(doctors).withConverter<DoctorModel>(
        fromFirestore: (snapshot, options) {
      return DoctorModel.fromJson(snapshot.id, snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  Future<void> addDoctor(DoctorModel data) async {
    try {
      await doctor.add(data);
    } catch (error) {
      log('error during adding doctor :$error');
    }
  }

  Future<void> updateDoctor(String id, DoctorModel data) async {
    try {
      await doctor.doc(id).update(data.toJson());
      log('Doctor successfully updated.');
    } catch (error) {
      log('error during updating doctor: $error');
    }
  }

  Future<void> deleteDoctor(String id) async {
    try {
      await doctor.doc(id).delete();
    } catch (error) {
      log('error during deleting doctor :$error');
    }
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    final snapshot = await doctor.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<String> uploadImage(imageName, imageFile) async {
    Reference imageFolder = storage.child('profileImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log('Image successfully uploaded to Firebase Storage.');
    return downloadURL;
  }
}
