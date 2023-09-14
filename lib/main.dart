import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/emailloginpage.dart';
import 'package:quiz_app/screen/emailsigninpage.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/login_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // '/':(context) => const HomePage(),
        '/':(context) => const LoginPage(),
        "emailsigninpage":(context) =>const EmailSigninPage(),
        'emailloginpage':(context) => const EmailLoginPage(),
        'homepage':(context) => const HomePage(),
        'loginpage':(context)=> const LoginPage()
      },
    );
  }
}


