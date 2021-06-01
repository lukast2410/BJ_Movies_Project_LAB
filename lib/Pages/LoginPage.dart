import 'package:BJ_Movies_LAB/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static LoginPage loginPage;

  static getInstance() =>
      loginPage = (loginPage == null) ? new LoginPage() : loginPage;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username, password;
  String errorUsername, errorPassword;
  bool usernameSuccess = true;
  bool passwordSuccess = true;

  Widget buildUsernameField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: kElevationToShadow[2],
          color: Colors.white),
      height: 50.0,
      child: TextField(
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 30,
          ),
          hintText: 'Username',
          hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
          contentPadding: EdgeInsets.only(top: 14.0),
        ),
        onChanged: (val) => username = val,
      ),
    );
  }

  Widget buildPasswordField() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: kElevationToShadow[2],
          color: Colors.white),
      height: 50.0,
      child: TextField(
        obscureText: true,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.black,
            size: 30,
          ),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
          contentPadding: EdgeInsets.only(top: 14.0),
        ),
        onChanged: (val) => password = val,
      ),
    );
  }

  void validateUser() {
    setState(() {
      usernameSuccess = true;
      passwordSuccess = true;
      if (username == null || username.isEmpty) {
        errorUsername = "You must fill the username!";
        usernameSuccess = false;
      } else if (username.contains(" ")) {
        errorUsername = "The username must not contain a space.";
        usernameSuccess = false;
      } else if (username.length < 5 || username.length > 20) {
        errorUsername = "The username length must be between 5-20 characters.";
        usernameSuccess = false;
      }

      if (password == null || password.isEmpty) {
        errorPassword = "You must fill the password!";
        passwordSuccess = false;
      }

      if (usernameSuccess && passwordSuccess) {
        //go to home
        HomePage.getInstance().setUsername(username);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage.getInstance()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFCC),
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: 85,
              left: 40,
              right: 40,
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
                SizedBox(height: 30),
                buildUsernameField(),
                SizedBox(height: 5),
                !usernameSuccess
                    ? Text(
                        errorUsername,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      )
                    : SizedBox(height: 0),
                SizedBox(height: 20),
                buildPasswordField(),
                SizedBox(height: 5),
                !passwordSuccess
                    ? Text(
                        errorPassword,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      )
                    : SizedBox(height: 0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 75),
                  child: RaisedButton(
                    elevation: 5.0,
                    color: Color(0xAA007663),
                    padding: EdgeInsets.all(13.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    onPressed: () => validateUser(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
