import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Team_Furious/Models/order_model.dart';
import 'package:Team_Furious/Services/orderService.dart';
import 'package:provider/provider.dart';

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  int quantity;
  int pricePerKg;
  bool verifed = false;

  void _showDialog(OrderService orderService) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Confirm Order Verfication"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("YES"),
              onPressed: () {
                orderService.updateOrder(quantity, pricePerKg, 'verified');
                Navigator.pushNamed(context, '/home');
              },
            ),
            new FlatButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget formBody(Order order, OrderService orderService) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 130.0,
                child: Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(' : ' + order.categoryName)
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 130.0,
                child: Text(
                  'Sub Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(' : ' + order.subCategoryName)
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 130.0,
                child: Text(
                  'Product',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(' : ' + order.product)
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 130.0,
                child: Text(
                  'Buying Quantity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(' : '),
              Container(
                width: 150.0,
                child: TextFormField(
                  initialValue: order.quantity.toString(),
                  autocorrect: false,
                  onSaved: (String value) {
                    quantity = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        !new RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter valid quantity';
                    }
                  },
                  decoration: new InputDecoration(
                    labelText: "Buying Quantity",
                    hintText: 'Buying Quantity',
                    suffixText: " Kg",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 130.0,
                child: Text(
                  'Buying Price per Kg',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(' : '),
              Container(
                width: 150.0,
                child: TextFormField(
                  initialValue: order.pricePerKg.toString(),
                  autocorrect: false,
                  onSaved: (String value) {
                    pricePerKg = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        !new RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter valid price per kg';
                    }
                  },
                  decoration: new InputDecoration(
                    labelText: "Price Per Kg",
                    hintText: 'Price Per Kg',
                    prefixText: "Rs.",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                'Verify Order',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                final FormState formState = _formKey.currentState;
                if (formState.validate()) {
                  formState.save();
                  _showDialog(orderService);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget img(Order order) {
    return CircleAvatar(
      radius: 80.0,
      backgroundImage: NetworkImage(order.subCategoryImage),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    OrderService orderService = Provider.of<OrderService>(context);

    Order order = orderService.getOrder();

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Form'),
      ),
      body: order != null
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: img(order),
                    margin: EdgeInsets.all(20.0),
                  ),
                  Center(
                    child: Container(
                      child: formBody(order, orderService),
                      width: 300.0,
                      margin: EdgeInsets.all(20.0),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
