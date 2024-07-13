import 'package:flutter/material.dart';
import 'package:kayla_machine_test/controller/bottom_bar_provider.dart';
import 'package:kayla_machine_test/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      body: Consumer<BottomBarProvider>(
          builder: (context, value, child) =>
              value.bottomScreens[value.currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 238, 240, 242),
          ),
          height: size.height * .09,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Consumer<BottomBarProvider>(
              builder: (context, value, child) => BottomNavigationBar(
                unselectedFontSize: 11,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                onTap: value.bottomBarOnTap,
                backgroundColor: const Color(0xFFFFFFFF),
                currentIndex: value.currentIndex,
                selectedItemColor: const Color(0xFF019744),
                unselectedItemColor: const Color(0xFF98A3B3),
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: value.currentIndex == 0
                        ? Image.asset(
                            'assets/home_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/home.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Home',
                      color: const Color(0xFF98A3B3),
                      fontWeight: FontWeight.bold,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.currentIndex == 1
                        ? Image.asset(
                            'assets/appointment_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/appointment.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Appointment',
                      color: const Color(0xFF98A3B3),
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.currentIndex == 2
                        ? Image.asset(
                            'assets/prescription_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/prescription.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Prescription',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                  BottomNavigationBarItem(
                    icon: value.currentIndex == 3
                        ? Image.asset(
                            'assets/profile_selected.png',
                            height: 25,
                            width: 30,
                          )
                        : Image.asset(
                            'assets/profile.png',
                            height: 25,
                            width: 30,
                          ),
                    label: poppinsText(
                      text: 'Profile',
                      color: const Color(0xFF98A3B3),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ).data,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
