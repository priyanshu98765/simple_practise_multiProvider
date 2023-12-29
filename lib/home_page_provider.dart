import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  bool _isLoggedIn=false;
  bool get isLoggedIn => _isLoggedIn;

  void logIn(){
    _isLoggedIn = true;
    notifyListeners();
  }

  void logOut(){
    _isLoggedIn = false;
    notifyListeners();
  }
}

class userDataProvider extends ChangeNotifier{
  String _userName="";
  String get userName => _userName;

  void setUserName(String name){
    _userName = name;
    notifyListeners();
  }
}