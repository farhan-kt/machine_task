class DoctorModel {
  String? id;
  String? image;
  String? fullName;
  String? district;
  String? email;
  String? phoneNumber;
  String? gender;

  DoctorModel({
    this.id,
    this.image,
    this.fullName,
    this.district,
    this.email,
    this.phoneNumber,
    this.gender,
  });

  factory DoctorModel.fromJson(String id, Map<String, dynamic> json) {
    return DoctorModel(
      id: id,
      image: json['image'],
      fullName: json['fullName'],
      district: json['district'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'fullName': fullName,
      'district': district,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
    };
  }
}
