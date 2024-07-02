import 'package:app/src/models/user_info_type.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserInfoType? userInfo;

  void setUserInfos({required UserInfoType info}) async {
    userInfo = info;

    notifyListeners();
  }

  void clearUserInfos() {
    userInfo = null;
    notifyListeners();
  }
}
