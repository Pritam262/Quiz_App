// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/login_page.dart';
import 'package:quiz_app/services/shared_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;
  getLoggedInState() async{
    await (SharedService.isLoggedIn())? isLogin= true: isLogin = false;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInState();
  }
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
        '/homepage':(context) => const HomePage(),
        '/loginpage':(context)=> const LoginPage()
      },
      home: isLogin? const HomePage(): const LoginPage(),
    );
  }
}

