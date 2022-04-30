
import 'package:designpattern/components/titleText.dart';
import 'package:designpattern/users_list/models/user_list_model.dart';
import 'package:flutter/material.dart';

class UserListRow extends StatelessWidget {

  final UserModel userModel;
  final void Function()? onTap;

  UserListRow({required this.userModel, this.onTap});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTitle(text: userModel.name!),
            Text(userModel.email!, style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
