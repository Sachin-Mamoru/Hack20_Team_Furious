import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class GSignIn extends StatefulWidget {
  @override
  State createState() => GSignInState();
}

class GSignInState extends State<GSignIn> {
  GoogleSignInAccount _currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    print('chek user?');
    if (this.mounted) {
      setState(() {
        _googleSignIn.disconnect();
        _googleSignIn.onCurrentUserChanged
            .listen((GoogleSignInAccount account) {
          _currentUser = account;
        });
        _googleSignIn.signInSilently();
        _handleSignIn();
      });
    }
  }

  Future<void> _handleSignIn() async {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      if (this.mounted) {
        setState(() {
          _currentUser = account;
        });
      }
      if (_currentUser != null) {
        //_handleGetContact();
        print('User logged');
      } else {
        print('No User Found');
      }
    });
    _googleSignIn.signInSilently();
    try {
      //await _googleSignIn.signIn();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      print(googleUser.email);
      print("--------------");
      await storeData(user.uid, user.displayName, user.photoUrl,
          user.email == null ? googleUser.email : user.email);
      print(user.email);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (error) {
      print(error);
    }
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      print('user here');
      String imgurlFullzize = _currentUser.photoUrl + '?sz=300';

      return Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/back.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 20),
              child: Container(
                width: 150.0,
                height: 150.0,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(imgurlFullzize),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Text('Welcome'),
            SizedBox(
              height: 10.0,
            ),
            Text(_currentUser.displayName.toString()),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Email:"),
                Text(_currentUser.email.toString()),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("UserID:"),
                Text(_currentUser.id.toString()),
              ],
            ),
            // SizedBox(
            //   height: 30.0,
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: <Widget>[
            //       RaisedButton(
            //         child: const Text('SIGN OUT'),
            //         onPressed: _handleSignOut, //me functon eka ehata
            //       ),
            //       RaisedButton(
            //         color: Colors.deepOrange,
            //         child: const Text('DASHBOARD'),
            //         onPressed: () {
            //           Navigator.pushReplacementNamed(context, '/dashboard');
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ]);
    } else {
      return Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: new Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 10.0),
                Text("Please Wait")
              ],
            ),
          ),
        ],
      );
    }
  }

  Future storeData(String id, String name, String url, String email) async {
    try {
      await Firestore.instance.collection('Users').document(id).setData({
        'name': name,
        'image': url,
        'tpNumber': "Undefined",
        'email': email
      });

      print("Successfull...!!!");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Google Sign In'),
        // ),
        body: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    ));
  }
}
