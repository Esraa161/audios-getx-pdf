import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDF extends StatefulWidget {
  const PDF({super.key});

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
      // body:  Center(
      //     child: SfPdfViewer.asset(
      //       'assets/pdf/finial.pdf',
      //     ),
      // ),
    );
  }
}
