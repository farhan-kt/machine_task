import 'package:flutter/material.dart';
import 'package:kayla_machine_test/view/appointments/appointment_screen.dart';
import 'package:kayla_machine_test/view/home/home_screen.dart';
import 'package:kayla_machine_test/view/prescription/prescription_screen.dart';
import 'package:kayla_machine_test/view/profile/profile_screen.dart';

class BottomBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  void bottomBarOnTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List bottomScreens = [
    const HomeScreen(),
    const AppointmentScreen(),
    const PrescriptionScreen(),
    const ProfileScreen()
  ];
}
