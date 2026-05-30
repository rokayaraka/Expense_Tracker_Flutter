import 'package:expanse_tracker_app/core/constants/app_colors.dart';
import 'package:expanse_tracker_app/features/presentation/screens/expanse_home_screen.dart';
import 'package:expanse_tracker_app/features/presentation/screens/splash_screen.dart';
import 'package:expanse_tracker_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
       scaffoldBackgroundColor: AppColors.appBackGroundColor,
      ),
      //home:  SplashScreen(),
           home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text('ERROR')));
          } else if (snapshot.hasData) {
            return ExpanseHomeScreen();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
    
  }
}

