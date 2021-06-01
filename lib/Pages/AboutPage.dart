import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About us",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFFFCC),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFFFFFCC),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.fill,
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "This application is made for those who likes to watch movies and need some recommendation. We will provide synoposis and other details about the movie. You can also send movie review in this application.",
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Thank you for using our apps :D",
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
