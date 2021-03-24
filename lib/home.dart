import 'package:first_app/filepage.dart';
import 'package:first_app/folder.dart';
import 'package:flutter/material.dart';
import './createfolder.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Map<String, FilePage> pages = {};
  List<Folder> folders = [];

  void create(String foldername) {
    for (int i = 0; i < folders.length; i++) {
      if (folders[i].title.toLowerCase == foldername.toLowerCase) {
        throw new Exception("File with this name already exist");
      }
    }
    setState(() {
      folders.add(Folder(foldername, pages[foldername], delete));
    });
  }

  void createPage(String pagename) {
    for (int i = 0; i < folders.length; i++) {
      if (folders[i].title.toLowerCase == pagename.toLowerCase) {
        throw new Exception("File with this name already exist");
      }
    }
    setState(() {
      var entry = {pagename: FilePage(pagename)};
      pages.addAll(entry);
    });
  }

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
          title: Text(
            "Netsystem",
            style: TextStyle(fontSize: 25, fontFamily: "Helvetica"),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          backgroundColor: Color.fromRGBO(133, 151, 120, 5),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [...(folders)],
          ),
        ),
        floatingActionButton: CreateFolder(create, createPage),
      ),
    );
  }
}
