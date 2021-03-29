import 'package:flutter/material.dart';

//Dialog box to create folders
class CreateFolder extends StatelessWidget {
  final Function create;

  CreateFolder(this.create);

  //create a pop up dialog
  //Future expects input
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //Dialog Box Title
            title: Text("Create Folder",
                style: TextStyle(
                  color: Color.fromRGBO(100, 127, 92, 5),
                )),
            //Text field to take input from user
            content: TextField(
              decoration: InputDecoration(hintText: "Folder Name"),
              controller: customController,
            ),
            actions: [
              MaterialButton(
                //Create File Icon
                child: Row(children: [
                  Icon(
                    Icons.create_new_folder,
                    color: Color.fromRGBO(100, 127, 92, 5),
                    size: 30,
                  ),
                  //Create Text
                  Padding(
                    padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                    child: Text(
                      "create",
                      style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: 17,
                          color: Color.fromRGBO(100, 127, 92, 5)),
                    ),
                  )
                ]),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(100, 127, 92, 5),
      child: Icon(Icons.add),
      onPressed: () {
        createAlertDialog(context).then((value) {
          print("foldername : $value");
          if (value != null) {
            create(value);
          }
        });
      },
    );
  }
}
