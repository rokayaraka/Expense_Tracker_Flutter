import 'package:expanse_tracker_app/application/services/auth_services.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
bool loader = false;

  final TextEditingController _emailCTRL = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/forget_pass.jpg',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),

                TextFormField(
                  controller: _emailCTRL,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your email",
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    fillColor: Colors.grey.withAlpha(65),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabled: true,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onTapPassResetFunc,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Send Password reset Email'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapPassResetFunc() async {
    if (_emailCTRL.text.isEmpty) {
      AuthServices.showSnackBar('Please Add Email', context);
    } else if (isValidEmail(_emailCTRL.text)) {
      AuthServices.showSnackBar('Please enter a valid Email', context);
    } else {
      setState(() {
        loader=true;
      });
    await  AuthServices.reserForgetPasswordSendEmail(_emailCTRL.text, context);
         setState(() {
        loader=false;
      });
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-0._%+-]+@[a-zA-z0-9.-]+\.[a-zA-z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}