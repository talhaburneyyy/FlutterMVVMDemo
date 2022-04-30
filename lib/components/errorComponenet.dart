import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  String errorText;

  ErrorText({this.errorText = ""});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorText,
          style: const TextStyle(fontSize: 18.0, color: Colors.redAccent),
        ),
      ),
    );
  }
}
