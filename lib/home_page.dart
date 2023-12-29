import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  String userName = "";
  int count = -1;

  void setName(String name) {
    userName = name;
    notifyListeners();
  }

  String getData() {
    count++;
    notifyListeners();
    return count.toString();
  }

}