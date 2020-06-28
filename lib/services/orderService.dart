// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Team_Furious/Models/order_model.dart';

class OrderService with ChangeNotifier {
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
      var Firestore; //wefweffewrfweffwfefwefwefewfeeeeeeeeeeeeeeeeee
      var document = await Firestore.instance
          .collection('Orders')
          .document(getOrderId())
          .get();
      if (document.data == null) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        this._order = new Order(
          document.data['objective'],
          document.data['name'],
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
        return true;
      }
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> updateOrder(quantity, price, status) async {
    try {
      var Firestore; /////////////////////////////////////////////////////////////////////
      await Firestore.instance
          .collection('Orders')
          .document(getOrderId())
          .updateData(
              {'quantity': quantity, 'pricePerKg': price, 'status': status});
    } catch (e) {
      print(e);
      return false;
    }
  }
}
