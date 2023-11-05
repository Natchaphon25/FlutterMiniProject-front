import 'package:flutter/material.dart';
import 'package:mini_project/models/chapter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerPage extends StatelessWidget {
  final Chapter chapter;
  const PDFViewerPage({Key? key, required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.orange,
        title: Text("chapter "+ chapter.chNum.toString()+"  "+chapter.chName),
      ),
      // body: SfPdfViewer.network("https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.white],
          ),
        ),
        child: SfPdfViewer.network(
          chapter.content,
          pageLayoutMode: PdfPageLayoutMode.single,
        ),
      ),
    );
  }
}
