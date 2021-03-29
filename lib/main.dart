import 'package:first_app/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "App",
    home: LoginPage(),
  ));
}

//Login Page
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(133, 151, 120, 5),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Stack(children: [
            // Person Icon
            Container(
              width: double.infinity,
              child: Icon(
                Icons.person,
                color: Color.fromRGBO(73, 82, 66, 5),
                size: 37,
              ),
              padding: EdgeInsets.fromLTRB(0, 105, 0, 0),
            ),
            //Hello Text
            Container(
              width: double.infinity,
              child: Text(
                "Hello",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(73, 82, 66, 5),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            ),
          ])),
          //Username Text Box
          Container(
              width: 250,
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: TextField(
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
                hintText: "USERNAME",
                hintStyle: TextStyle(color: Colors.white),
                // filled: true,
                // fillColor: Colors.white54,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
              ))),
          //Password Text Box
          Container(
              width: 250,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
                hintText: "PASSWORD",
                hintStyle: TextStyle(color: Colors.white),
                // filled: true,
                // fillColor: Colors.white54,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(73, 82, 66, 5), width: 3)),
              ))),
          //Invisible Separator
          SizedBox(
            height: 35,
          ),
          //Login Button
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
                    color: Colors.white,
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
