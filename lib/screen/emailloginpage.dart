import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/login_request_model.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../config.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  bool isHide = true;
  bool isApiCallProcess = false;
  late String? email;
  late String? password;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#283B71"),
      body: SafeArea(
        child: _loginUi(context),
      ),
    );
  }

  Widget _loginUi(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top container
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/kbc.jpg',
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              )),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Login Page",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [

                // Email input field
                TextFormField(
                  controller: emailController,
                  onChanged: (value){
                    email = value.toString();
                  },
                  keyboardType: TextInputType.emailAddress,
                  style:const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Email',
                    prefixIconColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    suffixIconColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                // Password input field
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: passController,
                    onChanged:(value){
                      password = value.toString();
                    },
                    obscureText: isHide,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      prefixIconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          icon: Icon(isHide
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      suffixIconColor: Colors.white,
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                // Forgot password
                Align(
                  alignment: Alignment.bottomRight,
                  child: RichText(text: TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ), children: <TextSpan>[
                      TextSpan(
                        text: 'Forgot Password',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()..onTap=(){
                          print('Forgot password');
                        },
                      )
                  ]
                  )),
                ),
                const SizedBox(height: 20,),

                // Submit button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormHelper.submitButton("Login", ()async{
                    // await loginWithEmail(email!, password!);
                    Navigator.pushNamed(context, 'homepage');
                  }, btnColor: HexColor('#283B71'), txtColor: Colors.white, borderRadius: 10),
                ),


              const  Text('OR', style: TextStyle(color: Colors.white, fontSize: 18),),

                // Text("Don't have an account click here"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RichText(text: TextSpan(
                    style: const TextStyle(color: Colors.white,fontSize: 16),
                    children:<TextSpan> [
                      const TextSpan(text: "Don't have an account?  "),
                      TextSpan(text: "Sign Up", style: TextStyle(color: Colors.white.withOpacity(0.6)),recognizer: TapGestureRecognizer()..onTap =(){
                        Navigator.pushNamed(context, 'emailsigninpage');
                      }),
                    ]
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

/*  bool validationAndSave(){
    final form = globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }*/

}
