import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_ui_designs/login/login_screen.dart';
import 'package:flutter_ui_designs/login/constants.dart';


class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60.0,
          child: ClipOval(
            child: Image.asset(
              'assets/default.png',
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );


    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
         onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen ()));},
        padding: EdgeInsets.all(12),
        color: Colors.blueAccent,
        child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
      ),
    );


    Widget _buildFirstnameTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'First Name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildLastnameTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Last Name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildEmailTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Email',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildPasswordTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Password',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      );
    }


    return Scaffold(
      backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage("assets/atro/B2.jpg"),
                                  fit: BoxFit.cover
                              )
                          )
                      ),
                   Container(
                     height: double.infinity,
                        child: Form(
                          key: _formKey,
                          autovalidate: _autoValidate,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                               child: Center(
                                  child: SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              height: 140,
                                              decoration: BoxDecoration(
                                                  image: new DecorationImage(
                                                      image: new AssetImage("assets/atro/logo.png"),
                                                      fit: BoxFit.cover
                                                  )
                                              )
                                          ),

                                          Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans',
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                       SizedBox(height: 28.0),
                                       logo,
                                       SizedBox(height: 48.0),
                                          _buildFirstnameTF(),
                                       SizedBox(height: 24.0),
                                          _buildLastnameTF(),
                                        SizedBox(height: 24.0),
                                          _buildEmailTF(),
                                       SizedBox(height: 24.0),
                                          _buildPasswordTF(),
                                      SizedBox(height: 12.0),
                                      signUpButton,

                    ],
                  ),
                ),
              ),
            ),
          ),
    )
    ]
    )


    )
        )
    );


  }
}
