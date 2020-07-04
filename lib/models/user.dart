import 'package:flutter/material.dart';

///存储页面间的共享数据

//用户登录状态
class UserStatus with ChangeNotifier {
  bool _loginStatus = false;
  String _userName;
  int _performance;

  get value => _loginStatus;

  get name => _userName;

  get perfromace => _performance;

  set name(String name) {
    _userName = name;
    notifyListeners();
  }

  set value(bool newStatus) {
    _loginStatus = newStatus;
    notifyListeners();
  }
}

