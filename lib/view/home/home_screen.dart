import 'package:flutter/material.dart';
import 'package:kayla_machine_test/controller/doctor_provider.dart';
import 'package:kayla_machine_test/view/home/doctor_form_screen.dart';
import 'package:kayla_machine_test/widgets/doctors_widget.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';
import 'package:kayla_machine_test/widgets/textformfield_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
    doctorProvider.getAllDoctors();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 230, 233),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 227, 230, 233),
        leading: poppinsHeadText(text: 'Doctors'),
        leadingWidth: size.width * .18,
        actions: [
          Consumer<DoctorProvider>(
            builder: (context, doctorValue, child) => Row(
              children: [
                homeDropDownButton(
                    hint: poppinsText(text: 'Gender'),
                    value: doctorValue.selectedHomeGender,
                    items: doctorValue.homeGenders.map((gender) {
                      return DropdownMenuItem(
                          value: gender,
                          child: interSubText(
                            text: gender,
                          ));
                    }).toList(),
                    onChanged: (value) {
                      doctorValue.setSelectedHomeGender(value.toString());
                    }),
                homeDropDownButton(
                    hint: poppinsText(text: 'District'),
                    value: doctorValue.selectedHomeDistrict,
                    items: doctorValue.homeDistrict.map((district) {
                      return DropdownMenuItem(
                          value: district,
                          child: interSubText(
                            text: district,
                          ));
                    }).toList(),
                    onChanged: (value) {
                      doctorValue.setSelectedHomeDistrict(value.toString());
                    }),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .02),
        child: Consumer<DoctorProvider>(
          builder: (context, doctorValue, child) {
            if (doctorValue.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (doctorValue.allDoctorList.isNotEmpty) {
                final allDoctor = doctorValue.allDoctorList;

                return ListView.builder(
                  itemCount: allDoctor.length,
                  itemBuilder: (context, index) {
                    final doctors = allDoctor[index];
                    return Column(
                      children: [
                        DoctorsWidget(
                          size: size,
                          doctor: doctors,
                          doctorProvider: doctorProvider,
                        ),
                        SizedBox(height: size.height * .02),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                    child: poppinsHeadText(
                  text: 'NO DOCTORS AVAILABLE',
                  color: const Color(0xFF019744),
                ));
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF019744),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DoctorFormScreen(
                        size: size,
                        isEdit: false,
                      )));
        },
        child: const Icon(
          Icons.add,
          color: Color(0xFFFFFFFF),
          size: 40,
        ),
      ),
    );
  }
}
