import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Getx2 extends StatefulWidget {
  const Getx2({super.key});

  @override
  State<Getx2> createState() => _Getx2State();
}

class _Getx2State extends State<Getx2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GETX2"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Get.back();
            }, child: Text("go to the GETX1")),
            ElevatedButton(onPressed: (){
              Get.snackbar("title", "message...........................");
            }, child: Text("snackbar GETX1")),
            ElevatedButton(onPressed: (){
              Get.defaultDialog(title: "title..................",
                  backgroundColor: Colors.white,
                buttonColor: Colors.cyan,
                content: Column(
                  children: [
                    Text("Dialog Content"),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                      },
                      child: Text("Close Dialog"),
                    ),
                  ],
                ),
              );
            }, child: Text("defaultDialog GETX1")),

          ],
        ),
      ),
    );
  }
}
