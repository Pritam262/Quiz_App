import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app/colorSchema.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services/shared_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    setState(() {
   APIService.getUserProfile();
   print('User Profile Data: ${APIService.getUserProfile().toString()}');

    });
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text('Hello world'),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            ),
              onPressed: () {
                SharedService.logout(context);
                /*      Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));*/
              },
              child: const Text('Log Out', style: TextStyle(color: white),))
        ],
      ),
    );
  }
}
