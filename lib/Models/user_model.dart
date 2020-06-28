import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'order_model.dart';

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

  String _orderId;
  Order _order;

  getOrderId() => _orderId;
  getOrder() => _order;

  setOrderId(String orderId) {
    _orderId = orderId;
    notifyListeners();
  }

  Future<bool> setOrder() async {
    
    try {
      var document = await Firestore.instance
          .collection('Project')
          .document(getOrderId())
          .get();
      if (document.data == null) {
        
        notifyListeners();
        return true;
      } else {
        this._order = new Order(
          document.data['objective'],
          document.data['name'],
          document.data['description'],
          document.data['image'],
          document.data['contact_name'],
          document.data['aim'],
          document.data['email'],
          document.data['date'],
          document.data['phone'],
          document.data['price'],
          document.data['service'],
          document.data['userId'],
        );
        print('set order');
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> updateOrder(objective, name, description, image, contact_name,
      aim, email, phone, price, service) async {
    try {
      await Firestore.instance
          .collection('Project')
          .document(getOrderId())
          .updateData({
        'objective': objective,
        'name': name,
        'description': description,
        'image': image,
        'contact_name': contact_name,
        'aim': aim,
        'email': email,
        'date': DateTime.now(),
        'phone': phone,
        'price': price,
        'service': service,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
