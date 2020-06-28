import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String _userId;
  String _userName;
  String _email;
  String _tpNumber;
  String _image;

  getUserId() => _userId;
  getUserName() => _userName;
  getEmail() => _email;
  getTpNumber() => _tpNumber;
  getimage() => _image;

  setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setTpNumber(String tpNumber) {
    _tpNumber = tpNumber;
    notifyListeners();
  }

  setImage(String image) {
    _image = image;
    notifyListeners();
  }
}
