import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/titleText.dart';
import '../view_models/user_view_model.dart';

class UserDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(userViewModel.selectedUser!.name!),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTitle(text: userViewModel.selectedUser!.name!),
            Text(userViewModel.selectedUser!.email!, style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
