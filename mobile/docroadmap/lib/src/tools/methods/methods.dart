import 'package:app/src/models/user_info_type.dart';
import 'package:app/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Map<String, String>? getHttpHeaders(BuildContext context) {
  var headers = <String, String>{
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };

  var usrToken = getUsrToken(context);

  if (usrToken != null && usrToken.isNotEmpty) {
    headers["Authorization"] = "Bearer $usrToken";
  }
  return headers;
}

UserInfoType? getUsrInfos(BuildContext context) {
  var userInfo = context.read<UserProvider>().userInfo;

  return userInfo;
}

String? getUsrToken(BuildContext context) {
  var userInfo = context.read<UserProvider>().userInfo;

  return userInfo?.token;
}
