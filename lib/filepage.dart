import 'package:flutter/material.dart';

class FilePage extends StatefulWidget {
  @override
  String titlePage;
  FilePage(this.titlePage);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FilePage(titlePage);
  }
}

class _FilePage extends State<FilePage> {
  String titlePage;
  _FilePage(this.titlePage);

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            titlePage,
            style: TextStyle(fontSize: 25, fontFamily: "Helvetica"),
          ),
          backgroundColor: Color.fromRGBO(133, 151, 120, 5)),
      body: Center(
          child: Column(children: [
        Text("Counter : $counter"),
        RaisedButton(
          child: Text("add"),
          onPressed: () {
            setState(() {
              counter = counter + 10;
            });
          },
        ),
        RaisedButton(
          color: Color.fromRGBO(100, 127, 92, 5),
          child: Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ])),
    );
  }
}
