import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Team_Furious/Models/order_model.dart';
import 'package:Team_Furious/Services/orderService.dart';
import 'package:provider/provider.dart';

class OrderForm extends StatefulWidget {
  final bool update;

  OrderForm({this.update});

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  int quantity;
  int price;
  int service;
  bool verifed = false;
  String project_name;
  String contact_name;
  String email;
  String aim;
  String objective;
  String phone;
  String image;

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
                orderService.updateOrder(objective, project_name, image,
                    contact_name, aim, email, phone, price, service);
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
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 130.0,
                  child: Text(
                    'Project Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue: widget.update ? order.name.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      project_name = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid name';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "Project Name",
                      hintText: 'Project Name',
                    ),
                    keyboardType: TextInputType.text,
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
                    'Project Aim',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue: widget.update ? order.aim.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      project_name = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid aim';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "Project aim",
                      hintText: 'Project aim',
                    ),
                    keyboardType: TextInputType.text,
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
                    'Project Objectives',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue:
                        widget.update ? order.objective.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      project_name = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid objective';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "Project Objectives",
                      hintText: 'Project Objectives',
                    ),
                    keyboardType: TextInputType.text,
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
                    'Buying Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue: widget.update ? order.price.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      price = int.parse(value);
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !new RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Please enter valid price';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "Price",
                      hintText: 'Price',
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
            Row(
              children: <Widget>[
                Container(
                  width: 130.0,
                  child: Text(
                    'Service Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue:
                        widget.update ? order.service.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      service = int.parse(value);
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !new RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Please enter valid price';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "Service Price",
                      hintText: 'Service Price',
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
            Row(
              children: <Widget>[
                Container(
                  width: 130.0,
                  child: Text(
                    'Contact Person',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue:
                        widget.update ? order.contact_name.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      contact_name = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter valid name';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "name",
                      hintText: 'name',
                    ),
                    keyboardType: TextInputType.text,
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
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue: widget.update ? order.email.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Please enter valid email address';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "email",
                      hintText: 'email',
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                    'Phone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(' : '),
                Container(
                  width: 150.0,
                  child: TextFormField(
                    initialValue: widget.update ? order.phone.toString() : null,
                    autocorrect: false,
                    onSaved: (String value) {
                      phone = value;
                    },
                    validator: (value) {
                      if (value.isEmpty ||
                          !new RegExp(r'^(?:[+0]9)?[0-9]{10}$')
                              .hasMatch(value)) {
                        return 'Please enter valid phone number';
                      }
                    },
                    decoration: new InputDecoration(
                      labelText: "phone",
                      hintText: 'phone',
                    ),
                    keyboardType: TextInputType.phone,
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
                  'Save Project',
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
      ),
    );
  }

  Widget img(Order order) {
    return CircleAvatar(
      radius: 80.0,
      backgroundImage: widget.update
          ? NetworkImage(order.image)
          : NetworkImage(
              'https://www.simrad-yachting.com/assets/img/default-product-img.png'),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    OrderService orderService = Provider.of<OrderService>(context);

    Order order = orderService.getOrder();

    return Scaffold(
      appBar: AppBar(
        title: Text('Project Form'),
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
