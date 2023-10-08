
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class AudiosScreen extends StatefulWidget {
  const AudiosScreen({super.key});

  @override
  State<AudiosScreen> createState() => _AudiosScreenState();
}


class _AudiosScreenState extends State<AudiosScreen> {
  final player = AudioPlayer();

  void playSound() {
     player.play(AssetSource("assets/sounds/Sm3na_com_56801.mp3")); // Replace 'assets/sound.mp3' with your sound file path
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound Player'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
              final player = AudioPlayer();
              player.play((AssetSource("sounds/mouse-click-153941.mp3")));
          },

          child: Text('Play Sound'),
        ),
      ),
    );
  }
}
