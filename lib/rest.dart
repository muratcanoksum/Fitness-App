import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';


class Rest extends StatelessWidget {
  const Rest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(127, 0, 228, 0.5),
      body: RestBody(),
    );
  }
}

class RestBody extends StatefulWidget {
  const RestBody({super.key});

  @override
  State<RestBody> createState() => _RestBodyState();
}

class _RestBodyState extends State<RestBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: CircularCountDownTimer(
                duration: 180,
                initialDuration: 0,
                controller: CountDownController(),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: Color(0xffFDEF03),
                fillGradient: null,
                backgroundGradient: null,
                backgroundColor: Color.fromRGBO(253, 239, 3, 0.7),
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w700,),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {

                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  if (duration.inSeconds == 0) {
                    return "Start";
                  } else {
                    return "Rest\n " +  Function.apply(defaultFormatterFunction, [duration])  + "\n sec";
                  }
                },
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Rest()),
              );
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
          ),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}

