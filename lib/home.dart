import 'package:first_app/folder.dart';
import 'package:first_app/homedrawer.dart';
import 'package:first_app/yearpage.dart';
import 'package:flutter/material.dart';
import './createfolder.dart';

//Page where all the files are located
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //Page of folder
  Map<String, YearPage> pages = {};
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
      var entry = {foldername: YearPage(foldername)};
      pages.addAll(entry);
      folders.add(Folder(foldername, delete, yearpage: pages[foldername]));
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
          title: Text(
            "Netsystem",
            style: TextStyle(fontSize: 25, fontFamily: "Helvetica"),
          ),
          //Logout Icon
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.logout),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   )
          // ],
          backgroundColor: Color.fromRGBO(133, 151, 120, 5),
        ),
        drawer: HomeDrawer(context),
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
