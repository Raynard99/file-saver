import 'package:first_app/filepage.dart';
import 'package:first_app/folder.dart';
import 'package:first_app/homedrawer.dart';
import 'package:flutter/material.dart';
import './createfolder.dart';

//Page where all the files are located
class MonthPage extends StatefulWidget {
  String title;
  MonthPage(this.title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MonthPageState(title);
  }
}

class _MonthPageState extends State<MonthPage> {
  String title;
  _MonthPageState(this.title);
  //Page of folder
  Map<String, FilePage> pages = {};
  //All folders
  List<Folder> folders = [];
//create new folder and it's page
  void create(String foldername) {
    for (int i = 0; i < folders.length; i++) {
      if (folders[i].title == foldername) {
        throw new Exception("File with this name already exist");
      }
    }
    setState(() {
      var entry = {foldername: FilePage(foldername)};
      pages.addAll(entry);
      folders.add(Folder(foldername, delete, page: pages[foldername]));
    });
  }

  //delete folder and it's page
  void delete(String title) {
    setState(() {
      pages.remove(title);
      for (int i = 0; i < folders.length; i++) {
        if (folders[i].title == title) {
          folders.removeAt(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //Text on Bar
          leading: RaisedButton(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromRGBO(133, 151, 120, 5),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 25, fontFamily: "Helvetica"),
          ),
          backgroundColor: Color.fromRGBO(133, 151, 120, 5),
        ),
        body: SingleChildScrollView(
          child: Column(
            //List of created files
            children: [...(folders)],
          ),
        ),
        //Create File Button
        floatingActionButton: CreateFolder(create),
      ),
    );
  }
}
