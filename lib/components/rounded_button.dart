import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Color buttonColor;
  String buttonTitle;
  Function onPress;
  RoundedButton({this.buttonColor, this.buttonTitle, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
          ),
        ),
      ),
    );
  }
}
