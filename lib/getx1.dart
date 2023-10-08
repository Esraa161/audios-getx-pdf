import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'getx2.dart';
class Getx1 extends StatefulWidget {
  const Getx1({super.key});

  @override
  State<Getx1> createState() => _Getx1State();
}

class _Getx1State extends State<Getx1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GETX1"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.to(Getx2());
          }, child: Text("go to the GETX2"))
        ],
      ),
    );
  }
}
