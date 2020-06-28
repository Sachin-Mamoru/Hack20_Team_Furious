import 'package:Team_Furious/Models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Team_Furious/Models/order_model.dart';
import 'package:Team_Furious/Services/orderService.dart';
import 'package:provider/provider.dart';

import '../profileImageUpload.dart';

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
  String project_name;
  String contact_name;
  String email;
  String aim;
  String objective;
  String phone;
  String image;
  String description;

  @override
  Widget build(BuildContext context) {
    // var orderService = Provider.of<OrderService>(context);
    // Order order;
    // if (widget.update) {
    //   order = orderService.getOrder();
    // }
    var userService = Provider.of<User>(context);

    return ChangeNotifierProvider<OrderService>(
      create: (context) => OrderService(),
      child: Consumer<OrderService>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: new Color(0xfff8faf8),
            centerTitle: true,
            elevation: 1.0,
            // leading: new Icon(Icons.camera_alt),
            title: SizedBox(
                height: 35.0,
                child: Image.asset("assets/images/insta_logo.png")),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: new IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () async {
                      print("Adding Data..!!!");
                    }),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: img(provider.getOrder()),
                  margin: EdgeInsets.all(20.0),
                ),
                Center(
                  child: Container(
                    child: formBody(provider.getOrder(), provider, userService),
                    width: 300.0,
                    margin: EdgeInsets.all(20.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(OrderService orderService, var userService) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Confirm Order Verfication"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("YES"),
              onPressed: () {
                if (widget.update) {
                  orderService.updateOrder(objective, project_name, description,
                      image, contact_name, aim, email, phone, price, service);
                } else {
                  orderService.createOrder(
                      objective,
                      project_name,
                      description,
                      image,
                      contact_name,
                      aim,
                      email,
                      phone,
                      price,
                      service,
                      userService.getimage());
                }
                Navigator.pushNamed(context, '/dashboard');
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

  Widget formBody(Order order, OrderService orderService, var userService) {
    return Form(
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
                  'Project Description',
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
                    description = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter valid description';
                    }
                  },
                  decoration: new InputDecoration(
                    labelText: "Project description",
                    hintText: 'Project description',
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
                    aim = value;
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
                    objective = value;
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
                  initialValue: widget.update ? order.service.toString() : null,
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
                        !new RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
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
                  _showDialog(orderService, userService);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget img(Order order) {
    if (widget.update) {
      return CircleAvatar(
        radius: 80.0,
        backgroundImage: widget.update
            ? NetworkImage(order.image)
            : NetworkImage(
                'https://www.simrad-yachting.com/assets/img/default-product-img.png'),
        backgroundColor: Colors.transparent,
      );
    } else {
      if (image == null) {
        image =
            "https://www.simrad-yachting.com/assets/img/default-product-img.png";
      }
      return Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(80.0),
                  image: new DecorationImage(
                      image: new NetworkImage(image), fit: BoxFit.cover)),
            ),
          ),
          IconButton(
            padding: EdgeInsets.fromLTRB(100.0, 130.0, 0.0, 0.0),
            icon: Icon(Icons.camera_alt),
            tooltip: 'Click to add a new Picture',
            color: Colors.redAccent,
            iconSize: 50.0,
            onPressed: () async {
              print("Add a new foto");
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileImageUpload()),
              );
              if (result != null) {
                setState(() {
                  image = result;
                });
              }

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           ImageUpload(widget.user, widget.uindex)),
              // );
            },
          ),
        ],
      );
    }
  }
}
