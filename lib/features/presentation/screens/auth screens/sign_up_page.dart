import 'package:expanse_tracker_app/application/services/auth_services.dart';
import 'package:expanse_tracker_app/features/presentation/screens/auth%20screens/sign_in_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailCTRL = TextEditingController();
  final TextEditingController _passwordCTRL = TextEditingController();
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/splashScreen.png'),
                ),

                SizedBox(height: 20),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.orange.shade800,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                TextFormField(
                  controller: _emailCTRL,
                  style: TextStyle(color: Colors.white),
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
                TextFormField(
                  controller: _passwordCTRL,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Enter your Password",

                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey.withAlpha(65),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabled: true,
                  ),
                ),

                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.orange.shade800,
                      foregroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/google-logo.webp'),
                        SizedBox(width: 10),

                        Text('Continue With Google'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: loader
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: _onTapSignUp,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.orange.shade800,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Sign Up'),
                        ),
                ),
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an Account?",
                      style: TextStyle(color: Colors.white),
                    ),

                    TextButton(
                      onPressed: _onTapSignIn,
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.orange.shade700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignIn() {
    Navigator.push(
      (context),
      MaterialPageRoute(builder: (context) => SigninPage()),
    );
  }

  void _onTapSignUp() async {
    setState(() {
      loader = true;
    });
    await AuthServices.handleSignUp(
      _emailCTRL.text.toString(),
      _passwordCTRL.text.toString(),
      context,
    );
    _clearControllers();
    setState(() {
      loader = false;
    });
  }

  void _clearControllers() {
    _emailCTRL.clear();
    _passwordCTRL.clear();
  }

  @override
  void dispose() {
    _emailCTRL.dispose();
    _passwordCTRL.dispose();
    super.dispose();
  }
}
