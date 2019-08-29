import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginEmail;
  String loginPassword;
  bool invalidLogin;
  final _auth = FirebaseAuth.instance;

  bool showSpinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  loginEmail = value;
                },
                decoration: kEmailInputDecoration,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  onChanged: (value) {
                    loginPassword = value;
                  },
                  decoration: kPasswordInputDecoration),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  buttonColor: Colors.lightBlueAccent,
                  buttonTitle: 'Log In',
                  onPress: () async {
                    //Go to registration screen.
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: loginEmail, password: loginPassword);
                      if (user != null) {
                        Navigator.pushNamed(context, LoginScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      invalidLogin = true;
                      print(e);
                    }
                  }),
              invalidLogin ??
                  Center(
                    child: Container(
                      child: Text(
                        'Invalid Login or Password',
                        style: TextStyle(color: Colors.red),
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
