// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? setup;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _initialize();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => setup == null ? const WelcomePage() : const Home(),
      ));
    });
  }

  Future<void> _initialize() async {
    setup = await getBool();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 28, 28, 28),
              Color.fromARGB(255, 20, 20, 20)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HW",
              style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(127, 0, 228, 1)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SPORT",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(253, 239, 3, 1)),
                ),
                Text(
                  "STAR",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(253, 239, 3, 1)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<bool?> getBool() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? asd = prefs.getBool("key");
  return asd;
}
