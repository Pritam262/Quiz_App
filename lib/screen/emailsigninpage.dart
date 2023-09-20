import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/register_user_model.dart';
import 'package:quiz_app/screen/emailloginpage.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../config.dart';

class EmailSigninPage extends StatefulWidget {
  const EmailSigninPage({super.key});

  @override
  State<EmailSigninPage> createState() => _EmailSigninPageState();
}

class _EmailSigninPageState extends State<EmailSigninPage> {
  bool ispassHide = true;
  bool isconpassHide = true;
  bool isApiCallProcess = false;
  late String? name;
  late String? email;
  late String? password;
  late String? conPassword;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  late TextEditingController conpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#283B71"),
      body: SafeArea(
        child: _signInUi(context),
      ),
    );
  }

  Widget _signInUi(BuildContext context) {
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
              "Signin Page",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [

                // Name input field
                TextFormField(
                  controller: nameController,
                  onChanged: (value){
                    name = value.toString();
                  },
                  keyboardType: TextInputType.text,
                  style:const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Name',
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
                    obscureText: ispassHide,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      prefixIconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispassHide = !ispassHide;
                            });
                          },
                          icon: Icon(ispassHide
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

                //Confirm Password input field
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: conpassController,
                    onChanged:(value){
                      conPassword= value.toString();
                    },
                    obscureText: isconpassHide,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      prefixIconColor: Colors.white,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isconpassHide = !isconpassHide;
                            });
                          },
                          icon: Icon(isconpassHide
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

                // Submit button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormHelper.submitButton("Register", ()async{
                    RegisterUserModel model = RegisterUserModel(
                      name: name,
                        email: email,
                        password: password,
                        conPassword:conPassword
                    );
                    APIService.registerWithEmail(model).then((response) {
                      setState(() {
                        isApiCallProcess= false;
                      });
                      if(response) {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/homepage',
                              (route) => false,);
                        // Navigator.pushReplacementNamed(context, 'homepage');
                      }else{
                        FormHelper.showSimpleAlertDialog(context, Config.appName, "Invalid UserName and Password", "OK", (){Navigator.of(context).pop();});
                      }
                    });
                    // Navigator.pushNamed(context, 'homepage');
                  }, btnColor: HexColor('#283B71'), txtColor: Colors.white, borderRadius: 10),
                ),

              const Text('OR', style: TextStyle(color: Colors.white, fontSize: 18),),

                // Text("Don't have an account click here"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RichText(text: TextSpan(
                      style: const TextStyle(color: Colors.white,fontSize: 16),
                      children:<TextSpan> [
                        const TextSpan(text: "Have an account?  "),
                        TextSpan(text: "Login", style: TextStyle(color: Colors.white.withOpacity(0.6)),recognizer: TapGestureRecognizer()..onTap =(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailLoginPage(),));
                        }),
                      ]
                  )),
                )

              ],
            ),
          ),
          // RichText(text: const TextSpan(children: [TextSpan(text: "Don't have an account"), TextSpan(text: "Click here", style: TextStyle(fontSize: 20))])),
        ],
      ),
    );
  }
}
