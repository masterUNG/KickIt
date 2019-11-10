import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_designs/login/constants.dart';
import 'package:flutter_ui_designs/login/sign_up.dart';



class ForgotPasswordScreen extends StatefulWidget {
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  @override
  void initState() {
    super.initState();
  }

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

    Widget _buildForgotBtn() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SignUpScreen()));
          },
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.blueAccent,
          child: Text(
            'FORGOT PASSWORD',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
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

    @override
    Widget build (BuildContext context) {
      return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            image: new DecorationImage(
                                image: new AssetImage("assets/atro/B6.jpg"),
                                fit: BoxFit.cover
                            )
                        )
                    ),

                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 30.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 140,
                                decoration: BoxDecoration(
                                    image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/atro/logo.png"),
                                        fit: BoxFit.cover
                                    )
                                )
                            ),

                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 28.0),
                            logo,
                            SizedBox(height: 48.0),
                            _buildEmailTF(),
                            SizedBox(height: 24.0),
                            _buildForgotBtn(),
                            SizedBox(height: 194.0),

                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          )
      );
    }
  }
