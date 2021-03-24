import 'package:first_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "App",
    home: LoginPage(),
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPage createState() => new _LoginPage();
// }

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(140, 158, 126, 5),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Stack(children: [
            Container(
              width: double.infinity,
              child: Icon(
                Icons.person,
                color: Color.fromRGBO(73, 82, 66, 5),
                size: 37,
              ),
              padding: EdgeInsets.fromLTRB(0, 105, 0, 0),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Hello",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            ),
          ])),
          Container(
              width: 250,
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: TextField(
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
                hintText: "USERNAME",
                hintStyle: TextStyle(color: Colors.white38),
                // filled: true,
                // fillColor: Colors.white54,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
              ))),
          Container(
              width: 250,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
                hintText: "PASSWORD",
                hintStyle: TextStyle(color: Colors.white38),
                // filled: true,
                // fillColor: Colors.white54,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
              ))),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 40,
            width: 150,
            // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(73, 82, 66, 5),
                border:
                    Border.all(width: 1, color: Color.fromRGBO(73, 82, 66, 5))),
            child: MaterialButton(
              child: Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
