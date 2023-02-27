import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thirdeyesmanagement/screens/auth_screen.dart';
import 'package:thirdeyesmanagement/screens/decesion.dart';
import 'package:thirdeyesmanagement/screens/getting_started_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => Future.delayed(const Duration(seconds: 2), () {
              _user();
            }));
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black))),
    ); // widget tree
  }

  Future<void> _user() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeMobile(),
          ));
        } else {
          userStateSave();
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  _onBoard() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const GettingStartedScreen(),
    ));
  }

  _decision() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const Decesion(),
    ));
  }

  Future<void> userStateSave() async {
    var value = await SharedPreferences.getInstance();
    if (value.getInt("userState") != 1) {
      _onBoard();
    } else {
      _decision();
    }
  }
}
