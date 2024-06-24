import 'package:fitnessapp/rest.dart';
import 'package:fitnessapp/workoutInfo.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exercise extends StatelessWidget {
  const Exercise({super.key});

  static WorkoutInfo workoutInfo = WorkoutInfo("", "", 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xffFDEF03)), // Change the icon and color as needed
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        title: Text(workoutInfo.name,style: TextStyle(color: Color(0xff7F00E4),fontWeight: FontWeight.w700)),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(AssetImage('assets/info.png'),color: Color(0xffFDEF03),),
            onPressed: () {
              // Arama işlemini burada gerçekleştirin
            },
          ),

        ],
      ),
      body: const ExerciseBody(),
    );
  }
}

class ExerciseBody extends StatefulWidget {
  const ExerciseBody({super.key});

  @override
  State<ExerciseBody> createState() => _ExerciseBodyState();
}

class _ExerciseBodyState extends State<ExerciseBody> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: Exercise.workoutInfo.image,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    _controller.addListener(_onControllerChange);
  }

  void _onControllerChange() {
    // Define what you want to do when controller changes here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(255, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 500,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(Exercise.workoutInfo.name, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600),),

                Container(
                  margin: EdgeInsets.all(16),
                  width:MediaQuery.of(context).size.width,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.watch_later_rounded),
                      SizedBox(width: 8,),
                      Text("${Exercise.workoutInfo.time} Secods"),
                      SizedBox(width: 20,),
                      Icon(Icons.local_fire_department),
                      SizedBox(width: 8,),
                      Text("${Exercise.workoutInfo.step} Rep"),
                    ],
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
