import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../users_list/models/user_list_model.dart';

class TextTitle extends StatelessWidget {
  String text;

  TextTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.oswald(textStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, ))
    );
  }
}
