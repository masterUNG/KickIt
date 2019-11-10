
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_designs/screens/home_screen.dart';

enum AuthMode { LOGIN, SINGUP }

class AtroLoginScreen extends StatefulWidget {
  @override
  _AtroLoginScreenState createState() => _AtroLoginScreenState();
}

class _AtroLoginScreenState extends State<AtroLoginScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height
  double screenHeight;


  AuthMode _authMode = AuthMode.LOGIN;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(padding: EdgeInsets.zero,
          children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/atro/B2.jpg"),
                    fit: BoxFit.cover
                )
            ),
             child: Stack(
                children: <Widget>[
                lowerHalf(context),
                upperHalf(context),
                _authMode == AuthMode.LOGIN
                ? loginCard(context)
                : singUpCard(context),
                pageTitle(),
          ],
        ),
      ),
     ]
      )
    );
  }

  Widget pageTitle() {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
        new Align(
          alignment: Alignment.topLeft,
        ),
          SizedBox(
            height: 25,
          ),
          Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                  child: Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFFFFFFFF)
                          ,fontFamily: 'Montserrat'

                      )
                  )
                  ,onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
              }
              )
          ),


          Image.asset('assets/atro/logo.png',
            height: 110,
            width: 480,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }


  Widget loginCard(BuildContext context) {
    return Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: screenHeight / 3.5),
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Your Email",
                          hasFloatingPlaceholder: true),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Password", hasFloatingPlaceholder: true),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {},
                          child: Text("Forgot Password ?"),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlatButton(
                          child: Text("Login"),
                          color: Colors.black54,
                          textColor: Colors.white,
                          padding: EdgeInsets.only(
                              left: 38, right: 38, top: 15, bottom: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "Don't have an account ?",
                style: TextStyle(color: Colors.white),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _authMode = AuthMode.SINGUP;
                  });
                },
                textColor: Colors.greenAccent,
                child: Text("Create Account"),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 0.7,
                color: Color(0xFFFFFFFF),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                  'Social Login',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white70,
                      fontFamily: 'Montserrat'

                  )
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 50,
                height: 0.7,
                color: Color(0xFFFFFFFF),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/atro/google.png'),
                  ),
                ),
                child: new FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                    child: null),
              ),
              SizedBox(
                width: 25,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/atro/facebook.png'),
                  ),
                ),
                child: new FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                    child: null),
              ),
              SizedBox(
                width: 1,
              ),
            ],
          )
        ]
    );
  }




  Widget singUpCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 5),
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Card(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your Name", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your Email", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password must be at least 8 characters and include a special character and number",
                    style: TextStyle(color: Colors.black38),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Already have an account?",
              style: TextStyle(color: Colors.white70),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.LOGIN;
                });
              },
              textColor: Colors.greenAccent,
              child: Text("Login"),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
            child: Text(
              "Terms & Conditions",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }




  Widget upperHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          color: Colors.transparent,
          width: 480.0,
          height: 799.0,

      ),
    );
  }


  Widget lowerHalf(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 480.0,
      height: 10.0,
    );
  }
}

