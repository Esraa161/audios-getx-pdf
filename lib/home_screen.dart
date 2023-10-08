import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>_animation;
  late Timer _timer;
  var audioIcon=Icons.pause;
  bool isActive =true;
  double finalDuration=Duration(minutes:5 ).inSeconds.toDouble();
  Duration duration =Duration(minutes: 5);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,
    duration: Duration(seconds: 7));
    _animation=Tween<double>(begin: 0,end: 2*pi).animate(_controller);
    _controller.repeat();
    startTimer();
  }
  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setCountDown();
    });
  }
    setCountDown(){
      const reduceCounter=1;
      final seconds= duration.inSeconds - reduceCounter;
      if(seconds<0){
        _timer.cancel();
        _controller.stop();
      }else{
        duration=Duration(seconds: seconds);
      }
      setState(() {

      });
    }

  @override
  Widget build(BuildContext context) {
    final minutes=duration.inMinutes.remainder(60).toString().padLeft(2,"0");
    final srcond=duration.inSeconds.remainder(60).toString().padLeft(2,"0");

    return Scaffold(
      body: Container(
       height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/-music.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child:ClipRRect(
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX:0,sigmaY: 0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/IRtMAD.gif"),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                  color: Colors.white.withOpacity(0.2),
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.7),
                  Colors.white.withOpacity(0.3)
                ],
                transform: GradientRotation(1),
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
              ),
              child: SafeArea(
                child: Padding(
                  padding:EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.navigate_before,size:15,),
                          ),
                          Text("Listen Now",
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                            ) ,),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.more_vert,size:15,),
                          ),
                        ],
                      ),
                      Expanded(child: AnimatedBuilder(
                        animation:_controller ,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _animation.value,
                          alignment: Alignment.center,
                          child: Container(
                            height: 230,
                            width: 230,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black87,
                                width: 3
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/Images/-music.jpg"),
                              ),

                            ),
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.black87,
                              ),
                            ),
                          ),);
                        },
                      ),
                      ),
                      Text("Butter",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                          fontSize: 25
                      ),),
                      Text("03m0m X Diable",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:15
                        ),),
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){},
                              child:CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.skip_previous),
                              ) ,
                            ),

                            InkWell(
                              onTap: (){
                                  if (isActive) {
                                    audioIcon = Icons.play_arrow;
                                    _timer.cancel();
                                    _controller.stop();
                                    setState(() {
                                      isActive = false;
                                    });

                                  } else {
                                    audioIcon = Icons.pause;
                                    startTimer();
                                    _controller.repeat();
                                    setState(() {
                                      isActive = true;
                                    });

                                  }

                              },
                              child:CircleAvatar(
                                backgroundColor: Colors.deepPurple,
                                child:isActive? Icon(Icons.pause,color: Colors.white,
                                ):Icon(Icons.play_arrow,color: Colors.white,
                                )
                              ) ,
                            ),
                            InkWell(
                              onTap: (){},
                              child:CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.skip_next),
                              ) ,
                            )],
                        ) ,),
                      SizedBox(
                        height: 30,
                      ),
                      SliderTheme(data: SliderThemeData(
                        overlayShape: SliderComponentShape.noOverlay
                      ), child: Slider(
                        value: finalDuration - duration.inSeconds.toDouble(),
                      onChanged:(value){
                          duration=Duration(
                            seconds: finalDuration.toInt() - value.toInt()
                          );
                          setState(() {

                          });
                      },
                      min: 00,
                      max: finalDuration,
                      activeColor: Colors.deepPurple,
                      )),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text("$minutes:$srcond",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
