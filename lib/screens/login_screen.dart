import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String loginEmail;
  String loginPassword;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
              onChanged: (value) {
                loginEmail = value;
              },
              decoration: kEmailInputDecoration,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
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
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: loginEmail, password: loginPassword);
                    Navigator.pushNamed(context, LoginScreen.id);
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
