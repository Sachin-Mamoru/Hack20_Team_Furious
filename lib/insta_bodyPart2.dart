import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
        //   supplierOrderService.setCategory(documentID);

        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => SubCategoery(documentID)));
      },
      child: Card(
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
                        dc.data['name'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () async {
                        print("Adding Data..!!!");
                        // await Firestore.instance
                        //     .collection('books')
                        //     .document()
                        //     .setData({'title': 'title', 'author': 'author'});
                        // print("Done------------");
                      }),
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
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Icon(
                        FontAwesomeIcons.heart,
                        color: Colors.red,
                      ),
                      new SizedBox(
                        width: 16.0,
                      ),
                      new Icon(
                        FontAwesomeIcons.comment,
                        color: Colors.grey,
                      ),
                      new SizedBox(
                        width: 16.0,
                      ),
                      new Icon(
                        FontAwesomeIcons.paperPlane,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  new Icon(
                    FontAwesomeIcons.bookmark,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dc.data['aim'],
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
    );
  }
}
