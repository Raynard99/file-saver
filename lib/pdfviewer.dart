import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ViewPdf extends StatefulWidget {
  PlatformFile data;
  ViewPdf(this.data);
  @override
  _ViewPdfState createState() => _ViewPdfState(data);
}

class _ViewPdfState extends State<ViewPdf> {
  PlatformFile data;
  _ViewPdfState(this.data);
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  // PDFDocument doc;
  @override
  Widget build(BuildContext context) {
    // viewNow() async {
    //   doc = await PDFDocument.fromAsset(
    //       "");
    //   setState(() {});
    // }

    // Widget loading() {
    //   viewNow();
    //   if (doc == null) return null;
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 151, 120, 5),
        title: Text(data.name),
      ),
      body: PDFView(
        filePath: data.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageSnap: true,
        pageFling: true,
        fitPolicy: FitPolicy.BOTH,
        fitEachPage: true,
        onRender: (_pages) {
          setState(() {
            pages = _pages;
            isReady = true;
          });
        },
        onError: (error) {
          setState(() {
            errorMessage = error.toString();
          });
          print(error.toString());
        },
        onPageError: (page, error) {
          setState(() {
            errorMessage = '$page: ${error.toString()}';
          });
          print('$page: ${error.toString()}');
        },
        onPageChanged: (int page, int total) {
          // print('page change: $page/$total');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 750),
              content: Text('page: ${page + 1} / $total'),
            ),
          );
          setState(() {
            currentPage = page;
          });
        },
      ),
    );
  }
}
