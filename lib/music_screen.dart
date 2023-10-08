import 'dart:math';
import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'constants.dart';


class MusicScreen extends StatefulWidget {
  static const String RouteName = 'MusicScreen';
  int currentIndex = 0;
  List<String> audioPaths = [
    "sounds/Sm3na_com_56801.mp3",
    "sounds/Sm3na_com_62296.mp3",
    "sounds/Sm3na_com_68473.mp3",
    "sounds/Sm3na_com_70585.mp3",
    "sounds/Sm3na_com_71392.mp3"
  ];
  List<String> imagePaths = [
    "assets/Images/img_7.png",
    "assets/Images/img_8.png",
    "assets/Images/img_5.png",
    "assets/Images/img_10.png",
    "assets/Images/img_11.png"
  ];

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> with SingleTickerProviderStateMixin{
  late AudioPlayer audioPlayer;
  bool isPlaying = false; // Track the playing state of the audio

  Duration audioDuration = Duration();
  Duration progress = Duration();

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,
        duration: Duration(seconds: 7));
    _animation=Tween<double>(begin: 0,end: 2*pi).animate(_controller);
    _controller.repeat();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      // Listen to the player state changes
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else {
        setState(() {
          isPlaying = false;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        progress = position;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio(audioPath) async {
    await audioPlayer.play(AssetSource(audioPath));
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }

  void seekAudio(Duration duration) {
    audioPlayer.seek(duration);
  }

  void goToNextSong() {
    if (widget.currentIndex < widget.audioPaths.length - 1) {
      setState(() {
        widget.currentIndex++;
      });
      stopAudio();
      playAudio(widget.audioPaths[widget.currentIndex]);
    }
  }

  void goToPreviousSong() {
    if (widget.currentIndex > 0) {
      setState(() {
        widget.currentIndex--;
      });
      stopAudio();
      playAudio(widget.audioPaths[widget.currentIndex]);
    }
  }
  late AnimationController _controller;
  late Animation<double>_animation;
  var audioIcon=Icons.pause;
  bool isActive =true;
  double finalDuration=Duration(minutes:5 ).inSeconds.toDouble();
  Duration duration =Duration(minutes: 5);

  @override
  Widget build(BuildContext context) {

    // var audioPath = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.audioPaths.length,
        controller: PageController(initialPage: widget.currentIndex),
        onPageChanged: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          var audioPath = widget.audioPaths[index];
          var imagePath = widget.imagePaths[index];

          return Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 531,
                    child: Stack(
                      children: [
                        Container(
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


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Feeling Arty \nFarty',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: KFontColor),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/Images/Path 38.png",
                                height: 7,
                                width: 28,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Text(
                              "35 min   .  12 Tracks",
                              style:
                                  TextStyle(fontSize: 13, color: KLightFontColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Playing next",
                              style:
                                  TextStyle(fontSize: 13, color: KLightFontColor),
                            ),
                            Text(
                              "David Manson - The ways to live",
                              style:
                                  TextStyle(fontSize: 12, color: KLightFontColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProgressBar(
                          thumbColor: const Color(0xFFF42E4CE),
                          progress: progress,
                          buffered: audioDuration,
                          // You can update this value if buffering is supported
                          total: audioDuration,
                          progressBarColor: const Color(0xFFF42E4CE),
                          bufferedBarColor:
                              const Color(0xFF42E4CE).withOpacity(0.3),
                          baseBarColor: const Color(0xFFF1F1F1),
                          onSeek: (duration) {
                            seekAudio(duration);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                goToPreviousSong();
                              },
                              icon: Image.asset(
                                "assets/Images/previous_btn.png",
                                height: 53,
                                width: 53,
                              ),
                            ),
                            IconButton(
                              onPressed: () {

                                if (isPlaying) {
                                  pauseAudio();
                                } else {
                                  playAudio(audioPath);
                                }
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                size: 53,
                                color: KPrimaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                goToNextSong();
                              },
                              icon: Image.asset(
                                "assets/Images/next_btn.png",
                                height: 53,
                                width: 53,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
