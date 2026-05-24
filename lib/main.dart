import 'package:expanse_tracker_app/core/constants/app_colors.dart';
//import 'package:expanse_tracker_app/features/presentation/screens/log_in_screen.dart';
import 'package:expanse_tracker_app/features/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
       scaffoldBackgroundColor: AppColors.appBackGroundColor,
      ),
      home:  SplashScreen(),
    );
  }
}

