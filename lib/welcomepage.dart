// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unnecessary_import, non_constant_identifier_names

import 'dart:ui';

import 'package:fitnessapp/setuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => WelcomeSetupPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/welcome.jpeg', // Arka plan resmi buraya
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(253, 239, 3, 1),
                    ),
                  ),
                  Text(
                    'HW',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        fontSize: 90,
                        color: Color.fromRGBO(127, 0, 228, 1),
                        height: 1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SPORT',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                            color: Color.fromRGBO(253, 239, 3, 1),
                            height: 1),
                      ),
                      Text(
                        'STAR',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                            color: Color.fromRGBO(253, 239, 3, 1),
                            height: 1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeSetupPage extends StatefulWidget {
  const WelcomeSetupPage({super.key});

  @override
  State<WelcomeSetupPage> createState() => _WelcomeSetupPageState();
}

class _WelcomeSetupPageState extends State<WelcomeSetupPage> {
  String bck_img = 'assets/1.jpeg';
  String text = '''Start Your Journey Towards \nA More Active Lifestyle''';
  String btn_lbl = "Next";
  String icn = 'assets/tracking.png';
  int page_no = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            bck_img, // Arka plan resmi buraya
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    color: Color.fromRGBO(127, 0, 228, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            icn,
                            scale: 9,
                          ),
                          SizedBox(height: 20),
                          Text(
                            text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 0,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 25,
                                height: 5,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: page_no == 1
                                      ? Colors.white
                                      : Color.fromRGBO(137, 108, 254, 1),
                                  borderRadius: BorderRadius.circular(
                                      15), // Kenarları bükülmüş
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 5,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: page_no == 2
                                      ? Colors.white
                                      : Color.fromRGBO(137, 108, 254, 1),
                                  borderRadius: BorderRadius.circular(
                                      15), // Kenarları bükülmüş
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 5,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: page_no == 3
                                      ? Colors.white
                                      : Color.fromRGBO(137, 108, 254, 1),
                                  borderRadius: BorderRadius.circular(
                                      15), // Kenarları bükülmüş
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (page_no == 1) {
                          page_no++;
                          bck_img = 'assets/2.jpeg';
                          icn = 'assets/star.png';
                          text =
                              '''Hollywood actors devote a lot of time to their figure in order to be in good shape. You can start too!''';
                        } else if (page_no == 2) {
                          page_no++;
                          bck_img = 'assets/2.jpeg';
                          icn = 'assets/home.png';
                          text =
                              '''Hollywood Actors Devote A Lot Of Time To Their Figure In Order To Be In Good Shape. You Can Start Too!''';
                          btn_lbl = "Get Started";
                        } else if (page_no == 3) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (_) => SetupPage(),
                          ));
                        } else {
                          text = "Error please contact with us!";
                        }
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 18,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(255, 255, 255, 0.1)),
                      child: Center(
                        child: Text(
                          btn_lbl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
