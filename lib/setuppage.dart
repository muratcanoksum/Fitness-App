// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:fitnessapp/home.dart';
import 'package:fitnessapp/vertical_picker/vertical_picker.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastify/toastify.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(35, 35, 35, 1),
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Image.asset('assets/3.jpeg'),
              SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      '''Our Bodies Are Capable Of Anything... We Must Convince Our Minds Of This.''',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Color.fromRGBO(253, 239, 3, 1)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    color: Color.fromRGBO(127, 0, 228, 1),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          '''Set up the data, in the following screens we will ask you questions in order to better understand your body and offer you the best exercises.''',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetupPageTwo()));
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
                          "Next",
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
            ],
          ),
        ],
      ),
    );
  }
}

///////////////////////////////
//////// PAGE TWO GENDER //////
///////////////////////////////

class SetupPageTwo extends StatefulWidget {
  const SetupPageTwo({super.key});

  @override
  State<SetupPageTwo> createState() => _SetupPageTwoState();
}

class _SetupPageTwoState extends State<SetupPageTwo> {
  int selected = 0;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Back",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
        titleSpacing: -10,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_drop_down,
              size: 40,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "What's Your Gender",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                    gender = "male";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.width / 2.5,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(100),
                      color: selected == 1
                          ? Color.fromRGBO(253, 239, 3, 1)
                          : Color.fromRGBO(255, 255, 255, 0.1)),
                  child: Icon(
                    Icons.male,
                    size: MediaQuery.of(context).size.width / 3.5,
                    color: selected == 1 ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Text(
                "Male",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                    gender = "female";
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.width / 2.5,
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(100),
                      color: selected == 2
                          ? Color.fromRGBO(253, 239, 3, 1)
                          : Color.fromRGBO(255, 255, 255, 0.1)),
                  child: Icon(
                    Icons.female,
                    size: MediaQuery.of(context).size.width / 3.5,
                    color: selected == 2 ? Colors.black : Colors.white,
                  ),
                ),
              ),
              Text(
                "Female",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (selected == 0) {
                    showToast(
                        context,
                        Toast(
                            title: "Error!",
                            description: "You have to choose a gender.",
                            lifeTime: Duration(seconds: 3)));
                  } else {
                    await saveInfo("gender", gender!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetupPageThree()));
                  }
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
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////
//////// PAGE THREE AGE ///////
///////////////////////////////

class SetupPageThree extends StatefulWidget {
  const SetupPageThree({super.key});

  @override
  State<SetupPageThree> createState() => _SetupPageThreeState();
}

class _SetupPageThreeState extends State<SetupPageThree> {
  int age = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color.fromRGBO(226, 241, 99, 1),
              ),
            ),
          ),
          titleSpacing: -10,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.arrow_drop_down,
                size: 40,
                color: Color.fromRGBO(226, 241, 99, 1),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(bottom: 80, top: 50),
                child: Text(
                  "How Old Are You?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                age.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 64,
                    color: Colors.white,
                    height: 1),
              ),
              Image.asset(
                'assets/arrow.png',
                scale: MediaQuery.of(context).size.width / 60,
              ),
              HorizontalPicker(
                minValue: 0,
                maxValue: 150,
                divisions: 150,
                height: MediaQuery.of(context).size.height / 6.5,
                showCursor: true,
                cursorColor: Colors.white,
                initialPosition: InitialPosition.start,
                backgroundColor: Color.fromRGBO(127, 0, 228, 1),
                activeItemTextColor: Colors.white,
                passiveItemsTextColor: Colors.black45,
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                  });
                },
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () async {
                  if (age < 11) {
                    showToast(
                        context,
                        Toast(
                            title: "Error!",
                            description:
                                "You have to bigger than 10 years old.",
                            lifeTime: Duration(seconds: 3)));
                  } else {
                    await saveInfo("age", age.toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetupPageFour()));
                  }
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
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

///////////////////////////////
//////// PAGE FOUR WEIGHT /////
///////////////////////////////

class SetupPageFour extends StatefulWidget {
  const SetupPageFour({super.key});

  @override
  State<SetupPageFour> createState() => _SetupPageFourState();
}

class _SetupPageFourState extends State<SetupPageFour> {
  double weight = 75;
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Back",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
        titleSpacing: -10,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_drop_down,
              size: 40,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "What Is Your Weight?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(253, 239, 3, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    child: Text(
                      "KG",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: selected == 1
                              ? Color.fromRGBO(127, 0, 228, 1)
                              : Colors.black),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Divider(
                      color: Colors.black,
                      height: 0,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 2;
                      });
                    },
                    child: Text(
                      "LB",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: selected == 2
                            ? Color.fromRGBO(127, 0, 228, 1)
                            : Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            HorizontalPicker(
              minValue: 0,
              maxValue: 150,
              divisions: 1500,
              height: MediaQuery.of(context).size.height / 6.5,
              showCursor: true,
              cursorColor: Colors.white,
              initialPosition: InitialPosition.center,
              backgroundColor: Color.fromRGBO(127, 0, 228, 1),
              activeItemTextColor: Colors.white,
              passiveItemsTextColor: Colors.black45,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            ),
            Image.asset(
              'assets/arrow.png',
              scale: MediaQuery.of(context).size.width / 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // İlk text (ağırlık değeri)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${weight.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 64,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: selected == 1 ? " Kg" : " Lb",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await saveInfo("weight", weight.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetupPageFive()));
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
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////
//////// PAGE FIVE HEIGHT /////
///////////////////////////////

class SetupPageFive extends StatefulWidget {
  const SetupPageFive({super.key});

  @override
  State<SetupPageFive> createState() => _SetupPageFiveState();
}

class _SetupPageFiveState extends State<SetupPageFive> {
  int height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Back",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
        titleSpacing: -10,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_drop_down,
              size: 40,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "What Is Your Height?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${height.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " cm",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 35,
                ),
                VerticalPicker(
                  minValue: 0,
                  maxValue: 250,
                  divisions: 250,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.height / 7,
                  showCursor: true,
                  cursorColor: Colors.white,
                  initialPosition: InitialPositions.center,
                  backgroundColor: Color.fromRGBO(127, 0, 228, 1),
                  activeItemTextColor: Color.fromRGBO(253, 239, 3, 1),
                  passiveItemsTextColor: Colors.black45,
                  onChanged: (value) {
                    setState(() {
                      height = value.toInt();
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset(
                    'assets/arrow.png',
                    scale: MediaQuery.of(context).size.width / 40,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await saveInfo("height", height.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetupPageSix()));
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
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////
//////// PAGE SIX LEVEL /////
///////////////////////////////

class SetupPageSix extends StatefulWidget {
  const SetupPageSix({super.key});

  @override
  State<SetupPageSix> createState() => _SetupPageSixState();
}

class _SetupPageSixState extends State<SetupPageSix> {
  int selected = 0;
  String useabout = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Back",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
        titleSpacing: -10,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_drop_down,
              size: 40,
              color: Color.fromRGBO(226, 241, 99, 1),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Physical Activity Level",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 1;
                        useabout = "Beginner";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          color: selected == 1
                              ? Color.fromRGBO(253, 239, 3, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Beginner",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: selected == 1
                                ? Colors.black
                                : Color.fromRGBO(127, 0, 228, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 2;
                        useabout = "Intermediate";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          color: selected == 2
                              ? Color.fromRGBO(253, 239, 3, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Intermediate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: selected == 2
                                ? Colors.black
                                : Color.fromRGBO(127, 0, 228, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = 3;
                        useabout = "Advance";
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          color: selected == 3
                              ? Color.fromRGBO(253, 239, 3, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Advance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: selected == 3
                                ? Colors.black
                                : Color.fromRGBO(127, 0, 228, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  if (selected == 0) {
                    showToast(
                        context,
                        Toast(
                            title: "Error!",
                            description: "You have to choose a level.",
                            lifeTime: Duration(seconds: 3)));
                  } else {
                    await saveInfo("level", useabout);
                    await saveBool(true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }
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
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> saveInfo(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<void> saveBool(bool value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("key", value);
}
