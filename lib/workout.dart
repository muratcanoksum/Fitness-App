import 'package:fitnessapp/db_helper.dart';
import 'package:fitnessapp/exercise.dart';
import 'package:fitnessapp/workoutInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  static var workoutId = 0;
  static WorkoutInfo? workoutInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xffFDEF03)), // Change the icon and color as needed
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        title: Text(workoutInfo!.name,style: const TextStyle(color: Color(0xff7F00E4),fontWeight: FontWeight.w700)),
        actions: <Widget>[
          IconButton(
            icon: const ImageIcon(AssetImage('assets/info.png'),color: Color(0xffFDEF03),),
            onPressed: () {
              // Arama işlemini burada gerçekleştirin
            },
          ),
        ],
      ),
      body: const WorkoutBody(),
    );
  }
}

class WorkoutBody extends StatefulWidget {
  const WorkoutBody({super.key});

  @override
  State<WorkoutBody> createState() => _WorkoutBodyState();
}

class _WorkoutBodyState extends State<WorkoutBody> {
  var data             = [];
  var workoutData      = [];
  var round            = 1;
  var roundList        = [];
  var roundWorkoutList = [];
  Future<void> getData() async {
    var db = DbHelper();
    await db.open();
    data = await db.getList();
    for(var d in data){
      if(d["type"] == Workout.workoutInfo?.name){
        print(d["type"]);
        workoutData.add(d);
      }
    }


    for(var d in workoutData){
      if(d["round"] == round){
        roundList.add(d);
      }else{
        round += 1;
        roundWorkoutList.add(roundList);
        roundList = [];
        roundList.add(d);
      }
    }
    roundWorkoutList.add(roundList);
    print(roundWorkoutList);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset("${Workout.workoutInfo?.image}"),
            ),
            for(int i = 0 ; i<roundWorkoutList.length ; i++)
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Round ${i+1}" , style: const TextStyle(color: Color(0xffFDEF03), fontSize: 25 ),),
                  for(int j = 0; j<roundWorkoutList[i].length;j++)
                  GestureDetector(
                    onTap: (){
                      Exercise.workoutInfo = WorkoutInfo(roundWorkoutList[i][j]["name"], roundWorkoutList[i][j]["videoId"], roundWorkoutList[i][j]["second"], 0, roundWorkoutList[i][j]["repetitions"]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Exercise()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white ,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              const SizedBox(width: 8,),
                              const Icon(Icons.play_circle_filled_rounded, size: 60,color: Color(0xff7F00E4),),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(roundWorkoutList[i][j]["name"]),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.watch_later),
                                      const SizedBox(width: 5,),
                                      Text("00:${roundWorkoutList[i][j]["second"]}")
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(padding: const EdgeInsetsDirectional.only(end: 10) ,child: Text("Repetition ${roundWorkoutList[i][j]["repetitions"]}x",style: const TextStyle(fontSize: 12),)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

