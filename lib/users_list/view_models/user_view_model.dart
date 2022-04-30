import 'package:designpattern/users_list/models/user_list_model.dart';
import 'package:designpattern/users_list/repo/api_status.dart';
import 'package:designpattern/users_list/repo/user_services.dart';
import 'package:flutter/material.dart';

import '../models/UserError.dart';

class UserViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel? _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel? get addingUser => _addingUser;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel){
    _userListModel = userListModel;
  }

  setUserError(UserError userError){
    _userError = userError;
  }

  setSelectedUser(UserModel userModel){
    _selectedUser = userModel;
  }

  addingUsers()async{
      if(!isValid()){
        return;
      }
      _userListModel.add(addingUser!);
      _addingUser = UserModel();
      notifyListeners();
      return true;
  }

  isValid(){
    if(addingUser!.name == null || addingUser!.name!.isEmpty){
      return false;
    }
    if(addingUser!.email == null || addingUser!.email!.isEmpty){
      return false;
    }
    return true;
  }

  UserViewModel(){
    getUsers();
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);
    }
    if(response is Failure){
      UserError userError = UserError(code: response.code, response: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}