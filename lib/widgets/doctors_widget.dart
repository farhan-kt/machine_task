import 'package:flutter/material.dart';
import 'package:kayla_machine_test/controller/doctor_provider.dart';
import 'package:kayla_machine_test/model/doctor_model.dart';
import 'package:kayla_machine_test/view/home/doctor_form_screen.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';

class DoctorsWidget extends StatelessWidget {
  final Size size;
  final DoctorModel? doctor;
  final DoctorProvider doctorProvider;

  const DoctorsWidget(
      {super.key,
      required this.size,
      this.doctor,
      required this.doctorProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .18,
      width: size.width * .95,
      padding: EdgeInsets.symmetric(vertical: size.height * .02, horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFFFFFFFF),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * .25,
            decoration: BoxDecoration(
              color: const Color(0xFFE5FBEF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFF019744),
                width: 1,
              ),
              image: DecorationImage(
                image: doctor!.image != null
                    ? NetworkImage(doctor!.image!)
                    : const AssetImage('assets/avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              poppinsText(
                text: 'Dr. ${doctor?.fullName}',
                color: const Color(0xFF101828),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              poppinsText(
                  text: 'BAMS,Resident Medical Officer',
                  color: const Color(0xFF676767),
                  overflow: TextOverflow.ellipsis,
                  fontSize: 10,
                  maxLine: 1),
              poppinsText(
                text: doctor?.district ?? '',
                color: const Color(0xFF676767),
                fontSize: 10,
              ),
            ],
          ),
          SizedBox(
            width: size.width * .02,
          ),
          SizedBox(
            width: size.width * .23,
            height: size.height * .04,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFF019744),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorFormScreen(
                              size: size,
                              isEdit: true,
                              doctor: doctor,
                              docProvider: doctorProvider,
                            )));
              },
              child: poppinsText(
                text: 'Edit Profile',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
