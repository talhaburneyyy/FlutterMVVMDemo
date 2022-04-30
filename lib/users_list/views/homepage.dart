import 'package:designpattern/components/errorComponenet.dart';
import 'package:designpattern/components/userlistrow.dart';
import 'package:designpattern/users_list/models/user_list_model.dart';
import 'package:designpattern/users_list/view_models/user_view_model.dart';
import 'package:designpattern/utils/navigationUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/loading.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                openAddUser(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [_ui(userViewModel)]),
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return AppLoading();
    }
    if (userViewModel.userError != null) {
      return ErrorText(
        errorText: userViewModel.userError.toString(),
        );
    }
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userModel = userViewModel.userListModel[index];
              return UserListRow(
                userModel: userModel,
                onTap: () async {
                  userViewModel.setSelectedUser(userModel);
                  openUserDetails(context);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: userViewModel.userListModel.length));
  }
}
