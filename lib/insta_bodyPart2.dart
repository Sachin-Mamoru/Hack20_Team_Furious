import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'Models/user_model.dart';

class CategeoryCard extends StatelessWidget {
  final DocumentSnapshot dc;
  final String documentID;
  CategeoryCard(this.dc, this.documentID);
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(documentID);
        var userService = Provider.of<User>(context);
        userService.setOrderId(documentID);
        userService.setOrder();
        Navigator.pushNamed(context, '/project');
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => SubCategoery(documentID)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(dc.data['user_image'])),
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Text(
                          dc.data['contact_name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: new Image.network(
                  dc.data['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new SizedBox(
                          width: 8.0,
                        ),
                        new RaisedButton(
                          onPressed: () {
                            print("object");
                          },
                          color: Colors.yellow[700],
                          child: Text(dc.data['name'],
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                    new RaisedButton(
                      onPressed: () {
                        print("object");
                      },
                      color: Colors.blue,
                      child: Text('Rs. '+dc.data['price'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  dc.data['description'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       new Container(
              //         height: 40.0,
              //         width: 40.0,
              //         decoration: new BoxDecoration(
              //           shape: BoxShape.circle,
              //           image: new DecorationImage(
              //               fit: BoxFit.fill,
              //               image: new NetworkImage(
              //                   "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
              //         ),
              //       ),
              //       new SizedBox(
              //         width: 10.0,
              //       ),
              //       Expanded(
              //         child: new TextField(
              //           decoration: new InputDecoration(
              //             border: InputBorder.none,
              //             hintText: "Add a comment...",
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
