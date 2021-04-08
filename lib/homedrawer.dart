// import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  BuildContext loginpage;
  HomeDrawer(this.loginpage);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color.fromRGBO(133, 151, 120, 5),
              child: Center(
                  child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 35),
                    child: Icon(
                      Icons.person,
                      size: 75,
                    ),
                  ),
                  Text(
                    "Raynard Widjaja",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("raynard.widjaja@stud.tu-darmstadt.de",
                          style:
                              TextStyle(color: Colors.white54, fontSize: 15)))
                ],
              ))),
          ListTile(
            leading: Icon(Icons.remove_red_eye),
            title: (Text("Change Pin")),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: (Text("Change Password")),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.monitor),
            title: (Text("Activity Log")),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: (Text("Settings")),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: (Text("Logout")),
            onTap: () {
              Navigator.pop(loginpage);
            },
          ),
        ],
      ),
    );
  }
}
