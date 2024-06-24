import 'package:fitnessapp/workout.dart';
import 'package:fitnessapp/workoutInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text("Workout",
            style: TextStyle(color: Color(0xff7F00E4),
                             fontSize: 32,
                             fontWeight: FontWeight.w700),),
            actions: <Widget>[
              IconButton(
                icon: ImageIcon(AssetImage('assets/info.png'),color: Color(0xffFDEF03),),
                onPressed: () {
                  // Arama işlemini burada gerçekleştirin
                },
              ),
            ],
      ),
      body: HomeBody(),
      );
  }
}


class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var currValue = 0;
  List<WorkoutInfo> workoutInfoList = [];


  WorkoutInfo workoutInfo1 = WorkoutInfo("Abs training from The Rock","assets/rock.png",45,1450,5);
  WorkoutInfo workoutInfo2 = WorkoutInfo("Press training Brad Pitt","assets/pitt.png",35,1250 ,5);
  WorkoutInfo workoutInfo3 = WorkoutInfo("Schwarzenegger's Leg Workout","assets/leg.png",44,1561,5);
  WorkoutInfo workoutInfo4 = WorkoutInfo("Vin Diesel's Hand Training","assets/hand.png",55,1233,5);
  WorkoutInfo workoutInfo5 = WorkoutInfo("Abs workout by Chris Hemsforth","assets/absworkout.png",47,1652,5);

  WorkoutInfo workoutInfo6 = WorkoutInfo("Fullbody workout","assets/fullbody.jpeg",60,1320,5);
  WorkoutInfo workoutInfo7 = WorkoutInfo("Lowebody Workout","assets/lowebody.png",60,2520,5);
  WorkoutInfo workoutInfo8 = WorkoutInfo("AB Workout","assets/abworkout.png",60,1720,5);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutInfoList = [workoutInfo1,workoutInfo2,workoutInfo3,workoutInfo4,workoutInfo5,workoutInfo6,workoutInfo7,workoutInfo8];
  }




  @override
  Widget build(BuildContext context) {
    return Container(

      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color(0xff7F00E4),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [





                ImageSlideshow(

                   width: double.infinity,

                   height: 200,


                   initialPage: 0,
                   indicatorColor: Colors.transparent,
                   indicatorRadius: 0,

                children: [
                  for(int i = 0 ; i<5;i++)
                     GestureDetector(
                       onTap: (){
                         Workout.workoutInfo =  workoutInfoList[i];
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => Workout()),
                         );
                       },
                       child: ClipRRect(
                                           borderRadius: BorderRadius.circular(16.0),
                                           child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0), // Köşeleri yuvarlat
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.23,
                              color: Colors.white10,
                              child: Image.asset(
                                "${workoutInfoList[i].image}",
                                fit: BoxFit.cover, // Resmi doldurmak için
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 1),
                              decoration: BoxDecoration(
                                color: Color(0xffFDEF03),
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Text("A workout from a Hollywood star"),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.06,
                              color: Colors.black45,
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(workoutInfoList[i].name,style: TextStyle(color: Color(0xffFDEF03)),),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled_rounded,size: 16,color: Colors.white,),
                                      SizedBox(width: 3,),
                                      Text("${workoutInfoList[i].time} Minutes",style: TextStyle(color: Colors.white),),
                                      SizedBox(width: 15,),

                                      Icon(Icons.local_fire_department,size: 16,color: Colors.white,),
                                      SizedBox(width: 3,),
                                      Text("${workoutInfoList[i].kcal} Kcal",style: TextStyle(color: Colors.white),),
                                      SizedBox(width: 15,),

                                      Icon(Icons.directions_run,size: 16,color: Colors.white,),
                                      SizedBox(width: 3,),
                                      Text("${workoutInfoList[i].step} Exercises",style: TextStyle(color: Colors.white),),
                                      SizedBox(width: 15,),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                                           ),
                                         ),
                     ),
                ],

                /// Called whenever the page in the center of the viewport changes.
                onPageChanged: (value) {
                     setState(() {
                       currValue = value;
                     });
                  print('Page changed: $value');
                },

                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: 3000,

                /// Loops back to first slide.
                isLoop: true,
              ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 8,
                        decoration: BoxDecoration(
                          color:  currValue == 0 ? Colors.white : Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        width: 35,
                        height: 8,
                        decoration: BoxDecoration(
                          color:  currValue == 1 ? Colors.white : Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        width: 35,
                        height: 8,
                        decoration: BoxDecoration(
                          color:  currValue == 2   ? Colors.white : Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        width: 35,
                        height: 8,
                        decoration: BoxDecoration(
                          color:  currValue == 3   ? Colors.white : Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        width: 35,
                        height: 8,
                        decoration: BoxDecoration(
                          color:  currValue == 4   ? Colors.white : Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
           ),
            SizedBox(height: 25,),
            Container(
                margin: EdgeInsets.symmetric(horizontal:16,vertical: 5),
                child: Text("Let's Go Training",style: TextStyle(color: Color(0xffFDEF03),fontSize: 22),)
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal:  16),
                child: Text("Explore Different Workout Styles",style: TextStyle(color: Colors.white,fontSize: 15),)
            ),
            SizedBox(height: 10,),

            for(int i = 5 ; i<8;i++)
              GestureDetector(
              onTap: (){
                  Workout.workoutInfo =  workoutInfoList[i];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Workout()),
                  );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.52,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(workoutInfoList[i].name,style: TextStyle(fontSize: 20),),
                          SizedBox(height: 8,),
                          Container(
                            child: Wrap(
                              children: [
                                Container(
                                  width: 90,
                                  child: Row(
                                    children: [
                                      Icon(Icons.watch_later,size: 17,),
                                      SizedBox(width: 5,),
                                      Text("${workoutInfoList[i].time} Minutes",style: TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: 90,
                                  child: Row(
                                    children: [
                                      Icon(Icons.local_fire_department_rounded,size: 18,),
                                      SizedBox(width: 2,),
                                      Text("${workoutInfoList[i].kcal} Kcal",style: TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                ),
              
                                Container(
                                  width: 90,
                                  child: Row(
                                    children: [
                                      Icon(Icons.directions_run_rounded,size: 18,),
                                      SizedBox(width: 3,),
                                      Text("${workoutInfoList[i].step} Exercises",style: TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.48 - 32,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          "${workoutInfoList[i].image}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),




          ],
        ),
      ),

    );
  }
}
