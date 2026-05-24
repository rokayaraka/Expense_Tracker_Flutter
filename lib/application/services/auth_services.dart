import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<String> signUpwithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'sign-up succesfull';
    } catch (e) {
      return 'Error during sign-up: ${e.toString()}';
    }
  }

  static handleSignUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    String massage = await signUpwithEmail(email, password);
    showSnackBar(massage, context);
  }

  static Future<String> signInwithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'sign-In succesfull';
    } catch (e) {
      return 'Error during sign-In: ${e.toString()}';
    }
  }

  // static Future<Map<String, dynamic>?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return null;
  //     }
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //     log(userCredential.toString());
  //     return null;
  //   } on Exception catch (e) {
  //     log('Google sign in error: $e');
  //     return null;
  //   }
  // }

  static handleSignIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    String massage = await signInwithEmail(email, password);
    showSnackBar(massage, context);
  }

  static void showSnackBar(String massage, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(massage, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.orange,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

static Future<void> reserForgetPasswordSendEmail(String email,BuildContext context)async{
  try {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  showSnackBar("Reset password email send successfully", context);
} on Exception catch (e) {
  // TODO
  showSnackBar("Error in reset password ${e.toString()}", context);
}
}

}