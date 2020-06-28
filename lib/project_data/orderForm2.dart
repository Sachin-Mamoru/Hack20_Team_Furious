import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Team_Furious/Models/order_model.dart';
import 'package:Team_Furious/Services/orderService.dart';
import 'package:provider/provider.dart';

class OrderFormTwo extends StatefulWidget {
  @override
  _OrderFormTwoState createState() => _OrderFormTwoState();
}

class _OrderFormTwoState extends State<OrderFormTwo> {
  Widget formBody(Order order, OrderService orderService) {
    return Column(
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
              child: Text(order.name),
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
              child: Text(order.aim),
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
              child: Text(order.objective),
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
              child: Text(order.price.toString()),
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
              child: Text(order.service.toString()),
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
              child: Text(order.contact_name),
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
              child: Text(order.email),
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
              child: Text(order.phone.toString()),
            ),
          ],
        ),
      ],
    );
  }

  Widget img(Order order) {
    return CircleAvatar(
      radius: 80.0,
      backgroundImage: NetworkImage(order.image),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    var orderService2 = Provider.of<OrderService>(context);

    Order order = orderService2.getOrder();

    return Scaffold(
      appBar: AppBar(
        title: Text('Project Data'),
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
                      child: formBody(order, orderService2),
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
