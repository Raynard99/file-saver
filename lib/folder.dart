import 'package:flutter/material.dart';
import './filepage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Folder extends StatelessWidget {
  String title;
  FilePage page;
  final Function delete;
  Folder(this.title, this.page, this.delete);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.5,
      controller: SlidableController(),
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 7, top: 7, left: 4, right: 4),
          height: 65,
          child: RaisedButton(
            color: Color.fromRGBO(125, 159, 115, 5),
            child: Row(children: [
              Icon(Icons.folder, color: Colors.white, size: 40.0),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        color: Colors.white,
                        fontSize: 20),
                  ))
            ]),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            onLongPress: () {},
          )),
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.redAccent,
          icon: Icons.delete_sharp,
          onTap: () {
            delete(title);
          },
          closeOnTap: true,
        )
      ],
    );
  }
}
