import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:quiz_app/screen/emailsigninpage.dart';
import 'package:snippet_coder_utils/hex_color.dart';

// import '../services/auth.dart';
import 'emailloginpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/kbc.jpg',
              width: 250,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Welcome, \n to KBC Quiz App',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            SignInButton(Buttons.Email,
                elevation: 5, padding: const EdgeInsets.symmetric(vertical: 13),
                onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmailLoginPage(),
                  ));
            }),
            const SizedBox(
              height: 10,
            ),

            // Signin With google
            SignInButton(Buttons.Google, elevation: 5, onPressed: () async {
              // await signWithGoogle();
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked,
                    fillColor: const MaterialStatePropertyAll(Colors.blue),
                    checkColor: Colors.blue,
                    onChanged: (value) {
                      if (isChecked) {
                        isChecked = false;
                        print(isChecked);
                      } else {
                        isChecked = true;
                        print(isChecked);
                      }
                      setState(() {});
                    }),
                const Text(
                  'By Continuing, You are agree with our app',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ));
  }
}
