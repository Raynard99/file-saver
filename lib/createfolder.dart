import 'package:flutter/material.dart';

class CreateFolder extends StatelessWidget {
  final Function create;
  final Function createPage;

  CreateFolder(this.create, this.createPage);

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create Folder",
                style: TextStyle(
                  color: Color.fromRGBO(100, 127, 92, 5),
                )),
            content: TextField(
              decoration: InputDecoration(hintText: "Folder Name"),
              controller: customController,
            ),
            actions: [
              MaterialButton(
                child: Row(children: [
                  Icon(
                    Icons.create_new_folder,
                    color: Color.fromRGBO(100, 127, 92, 5),
                    size: 30,
                  ),
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
            createPage(value);
            create(value);
          }
        });
      },
    );
  }
}
