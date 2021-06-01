import 'package:BJ_Movies_LAB/Pages/AboutPage.dart';
import 'package:BJ_Movies_LAB/Pages/HomePage.dart';
import 'package:BJ_Movies_LAB/Pages/LoginPage.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  static bool isHome = true;
  State<StatefulWidget> state;

  MyDrawer(this.state);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, bottom: 25),
            color: Color(0xFFFFFFCC),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Image(
                        image: AssetImage('assets/imposter.png'),
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hi, " + HomePage.getInstance().username,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: FlatButton(
              onPressed: () {
                isHome
                    ? null
                    : Navigator.pushReplacement(
                        state.context,
                        MaterialPageRoute(
                            builder: (ctx) => HomePage.getInstance()));
                isHome = true;
              },
              child: Row(
                children: [
                  Container(
                    width: 35,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.home_outlined),
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutPage()));
              },
              child: Row(
                children: [
                  Container(
                    width: 35,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.info_outline),
                    ),
                  ),
                  Text(
                    'About us',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                    state.context,
                    MaterialPageRoute(
                        builder: (ctx) => LoginPage.getInstance()));
                isHome = true;
              },
              child: Row(
                children: [
                  Container(
                    width: 35,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.logout),
                    ),
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
