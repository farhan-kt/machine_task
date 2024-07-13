// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:kayla_machine_test/controller/doctor_provider.dart';
// import 'package:kayla_machine_test/model/doctor_model.dart';
// import 'package:kayla_machine_test/widgets/normal_widgets.dart';
// import 'package:kayla_machine_test/widgets/snackbar_widget.dart';
// import 'package:kayla_machine_test/widgets/text_widget.dart';

// class FormAppBar extends StatelessWidget {
//   DoctorProvider doctorProvider;
//   final bool? isEdit;
//   final Size size;
//   final DoctorModel? doctor;
//   FormAppBar(
//       {super.key,
//       required this.doctorProvider,
//       this.isEdit,
//       required this.size,
//       this.doctor});

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(kToolbarHeight),
//       child: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//               doctorProvider.clearDoctorAddingControllers();
//             },
//             icon: const Icon(Icons.arrow_back_ios_new)),
//         title: isEdit == true
//             ? interHeadText(
//                 text: 'Edit Profile',
//               )
//             : interHeadText(
//                 text: 'Add Doctor',
//               ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         actions: [
//           if (isEdit == true)
//             IconButton(
//               onPressed: () {
//                 confirmationDialog(
//                   context,
//                   size,
//                   confirmText: 'Delete',
//                   onPressedConfirm: () async {
//                     doctorProvider.deleteDoctor(
//                       doctor!.id!,
//                     );
//                     SnackBarWidget().showSuccessSnackbar(
//                         context, 'Dr. ${doctor?.fullName ?? ''} is Deleted');
//                     Navigator.pop(context);
//                     Navigator.pop(context);
//                     doctorProvider.getAllDoctors();
//                   },
//                   alertMessage:
//                       'Confirm to delete the Dr. ${doctor?.fullName ?? ''} ',
//                 );
//               },
//               icon: const Icon(
//                 Icons.delete,
//                 color: Colors.red,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
