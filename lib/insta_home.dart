import 'package:Team_Furious/insta_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/user_model.dart';

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  FirebaseUser user;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var userService;
  Future getUser() async {
    Future.delayed(Duration.zero, () {
      userService = Provider.of<User>(context, listen: false);
    });

    user = await _auth.currentUser();
    if (user == null) {
      print("No user");
      getUser();
    } else {
      Firestore.instance
          .collection('Users')
          .document(user.uid)
          .get()
          .then((DocumentSnapshot ds) {
        print(ds['image']);
        print(ds['name']);
        print(ds['email']);
        userService.setImage(ds['image']);
        userService.setUserId(user.uid);
        userService.setUserName(ds['name']);
        userService.setTpNumber(
            ds['tpNumber'] == "undefined" ? "Add TP Number" : ds['tpNumber']);
        userService.setEmail(ds['email']);
        // setState(() {
        //   imgurl = ds['image'];
        //   userService.setImage(imgurl);
        //   username = user.displayName == null
        //       ? user.phoneNumber == null ? "Loading..." : user.phoneNumber
        //       : user.displayName;

        // userService.setUserId(user.uid);
        // userService.setUserName(ds['name']);
        // userService.setTpNumber(ds['tpNumber']);
        // userService.setEmail(ds['email']);
        // });
      });
    }
  }

  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(
        height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: new InstaBody(),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          alignment: Alignment.center,
          child: new BottomAppBar(
            child: new Row(
              // alignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    print(userService.getimage());
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    print("object");
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.add_box,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    print("object");
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  onPressed: () {
                    print("object");
                  },
                ),
                new IconButton(
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
