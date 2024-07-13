import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kayla_machine_test/controller/bottom_bar_provider.dart';
import 'package:kayla_machine_test/controller/doctor_provider.dart';
import 'package:kayla_machine_test/firebase_options.dart';
import 'package:kayla_machine_test/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
      ),
    );
  }
}
