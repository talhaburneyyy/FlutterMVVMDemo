import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/user_view_model.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        actions: [IconButton(onPressed: () async {
          bool userAdded = await userViewModel.addingUsers();
          if(!userAdded){
            return;
          }
          Navigator.pop(context);
        }, icon: Icon(Icons.save))],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              onChanged: (val) async {
                userViewModel.addingUser?.name = val;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              onChanged: (val) async {
                userViewModel.addingUser?.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}
