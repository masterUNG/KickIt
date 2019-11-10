import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_ui_designs/apps.dart';
import 'package:flutter_ui_designs/login/constants.dart';

import 'package:flutter_ui_designs/utility/my_alert.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String firstName, lastName, email, password;
  final formKey = GlobalKey<FormState>();

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

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          formKey.currentState.save();
          print(
              'FirstName = $firstName, Last = $lastName, email = $email, password = $password');
          registerThread();
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blueAccent,
        child: Text(
          'SIGNUP',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Future<void> registerThread() async {
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      normalDialog(context, 'Have Space', 'Please Fill Every Blank');
    } else {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((response) {
        findUID();
      }).catchError((response) {
        String title = response.code;
        String message = response.message;
        normalDialog(context, title, message);
      });
    }
  }

  Future<void> findUID() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    String uidLogin = firebaseUser.uid;
    updateDatabaseThread(uidLogin);
  }

  Future<void> updateDatabaseThread(String uidLogin) async {
    Map<String, dynamic> map = Map();
    map['Avatar'] =
        'https://firebasestorage.googleapis.com/v0/b/kickit2-88794.appspot.com/o/Avatar%2Ficonfinder_free-17_463011.png?alt=media&token=0a97cc7b-e765-4302-88af-359f7efb05a0';
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Email'] = email;
    map['Password'] = password;

    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('User');
    await collectionReference
        .document(uidLogin)
        .setData(map)
        .then((response) {
          print('Register Success');
          MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context)=>KickItApps());
          Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route)=>false);
        });
  }

  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            obscureText: false,
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
            onSaved: (value) {
              firstName = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
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
            onSaved: (value) {
              lastName = value.trim();
            },
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
          child: TextFormField(
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
            onSaved: (value) {
              email = value.trim();
            },
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
          child: TextFormField(
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
            onSaved: (value) {
              password = value.trim();
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
                          image: new AssetImage("assets/atro/B2.jpg"),
                          fit: BoxFit.cover))),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 30.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 140,
                            decoration: BoxDecoration(
                                image: new DecorationImage(
                                    image:
                                        new AssetImage("assets/atro/logo.png"),
                                    fit: BoxFit.cover))),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        logo,
                        SizedBox(height: 20.0),
                        _buildFirstNameTF(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildLastNameTF(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildPasswordTF(),
                        SizedBox(
                          height: 20.0,
                        ),
                        _buildSignUpBtn(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
