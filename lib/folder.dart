import 'package:first_app/yearpage.dart';
import 'package:flutter/material.dart';
import 'monthpage.dart';
import 'filepage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//Folder (Item)
class Folder extends StatelessWidget {
  String title;
  YearPage yearpage;
  MonthPage monthpage;
  FilePage page;
  final Function delete;
  Folder(this.title, this.delete, {this.yearpage, this.monthpage, this.page});

  @override
  Widget build(BuildContext context) {
    //available to slide object
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.5,
      controller: SlidableController(),

      //folder button
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 7, top: 7, left: 4, right: 4),
          height: 65,
          child: RaisedButton(
            color: Color.fromRGBO(125, 159, 115, 5),
            child: Row(children: [
              //folder icon
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
              if (yearpage != null) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => yearpage));
              } else if (monthpage != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => monthpage));
              } else {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
              }
            },
            onLongPress: () {},
          )),
      //slide action (right)
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
