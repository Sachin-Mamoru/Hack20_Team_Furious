import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:im_mobile/Profile/ImageUpload.dart';

import 'package:provider/provider.dart';
import 'Models/user_model.dart';

class ProfileManagement extends StatefulWidget {
  @override
  _ProfileManagementState createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  final formkey = new GlobalKey<FormState>();
  String name;
  String email;
  String address;
  String tPnumber;
  int _state = 0;
  String changedImageUrl;

  Widget buildDataList(User userService) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          _avatarImage2(userService.getimage()),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 14.0,
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Name    ")
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: AutoSizeText(
                    userService.getUserName(),
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 14.0,
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Email     ")
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: AutoSizeText(
                    userService.getEmail(),
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 14.0,
              ),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Phone   ")
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: AutoSizeText(
                    userService.getTpNumber(),
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Update Your Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      _state = 1;
                    });
                  },
                  color: Colors.blue,
                ),
                FlatButton(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      _state = 1;
                    });
                  },
                  color: Colors.red[500],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // DecorationImage _buildbackgroundImage() {
  //   return DecorationImage(
  //     fit: BoxFit.cover,
  //     colorFilter:
  //         ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
  //     image: AssetImage('assets/back.png'),
  //   );
  // }

  Widget _avatarImage0() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160.0,
        height: 160.0,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(80.0),
            image: new DecorationImage(
                image: new NetworkImage(changedImageUrl), fit: BoxFit.cover)),
      ),
    );
  }

  Widget _avatarImage1(String image) {
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
          color: Colors.grey,
          iconSize: 50.0,
          onPressed: () async {
            print("Add a new foto");
            // final result = await Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ImageUpload()),
            // );
            // if (result != null) {
            //   setState(() {
            //     changedImageUrl = result;
            //   });
            // }
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

  Widget _avatarImage2(String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160.0,
        height: 160.0,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(80.0),
            image: new DecorationImage(
                image: new NetworkImage(image), fit: BoxFit.cover)),
      ),
    );
  }

  Widget _usernameTF(String name) {
    return TextFormField(
      initialValue: name,
      style: TextStyle(
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          icon: const Icon(
            Icons.person,
            color: Colors.orange,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          labelStyle: TextStyle(color: Colors.orange, letterSpacing: 1.5),
          hintStyle: TextStyle(letterSpacing: 1.3),
          labelText: 'User Name',
          filled: true,
          fillColor: Colors.transparent),
      validator: (value) => value.isEmpty ? 'User Name Can\'t be empty' : null,
      onSaved: (String value) {
        this.name = value;
      },
    );
  }

  Widget _emailTF(String email) {
    return TextFormField(
      initialValue: email,
      style: TextStyle(
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          icon: const Icon(
            Icons.mail,
            color: Colors.orange,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          labelStyle: TextStyle(color: Colors.orange, letterSpacing: 1.5),
          hintStyle: TextStyle(letterSpacing: 1.3),
          labelText: 'Email',
          filled: true,
          fillColor: Colors.transparent),
      validator: (value) => value.isEmpty ? 'Email Can\'t be empty' : null,
      onSaved: (String value) {
        this.email = value;
      },
    );
  }

  Widget _telephoneTF(String tpNumber) {
    return TextFormField(
      initialValue: tpNumber,
      style: TextStyle(
        color: Colors.blue,
      ),
      decoration: InputDecoration(
          icon: const Icon(
            Icons.phone_in_talk,
            color: Colors.orange,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
          ),
          labelStyle: TextStyle(color: Colors.orange, letterSpacing: 1.5),
          hintStyle: TextStyle(letterSpacing: 1.3),
          labelText: 'Telephone Number',
          filled: true,
          fillColor: Colors.transparent),
      validator: (value) => value.isEmpty ? 'This Can\'t be empty' : null,
      onSaved: (String value) {
        this.tPnumber = value;
      },
    );
  }

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is Valid');
      print(name);
      print(email);
      print(tPnumber);

      return true;
    } else {
      print('Form is Null');
      //_showSnackBar1(); flutter toast
      return false;
    }
  }

  Widget _registerButton(User userService) {
    return Container(
      width: 200.0,
      child: new Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: new MaterialButton(
            splashColor: Colors.white,
            child: setUpButtonChild(),
            onPressed: () async {
              if (validateAndSave()) {
                setState(() {
                  _state = 2;
                });
                try {
                  await Firestore.instance
                      .collection('Users')
                      .document(userService.getUserId())
                      .setData({
                    'name': name,
                    'image': changedImageUrl == null
                        ? userService.getimage()
                        : changedImageUrl,
                    'tpNumber': tPnumber,
                    'email': email
                  });

                  print("Successfull...!!!");
                  setState(() {
                    _state = 3;
                  });
                  Navigator.pushReplacementNamed(context, '/dashboard');
                } catch (e) {
                  print(e);
                }
              } else {
                print('Unsuseees');
              }
            },
            minWidth: double.infinity,
            height: 48.0,
            color: Colors.lightGreen,
          ),
        ),
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 1) {
      return new Text(
        "Update",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 2) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Text(
        'Update Sucess',
        style: TextStyle(color: Colors.white),
      )
          // Icon(Icons.thumb_up, color: Colors.white),
          ;
    }
  }

  @override
  void initState() {
    super.initState();
    if (changedImageUrl != null) {
      setState(() {
        _state = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var userService = Provider.of<User>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Your Profile"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: _state == 0
              ? buildDataList(userService)
              : Center(
                  child: new SingleChildScrollView(
                      padding: new EdgeInsets.fromLTRB(32.0, 10.0, 32.0, 5.0),
                      child: new Form(
                        key: formkey,
                        child: new Center(
                          child: new Column(
                            children: <Widget>[
                              changedImageUrl == null
                                  ? _avatarImage1(userService.getimage())
                                  : _avatarImage0(),
                              _usernameTF(userService.getUserName()),
                              _emailTF(userService.getEmail()),
                              _telephoneTF(userService.getTpNumber()),
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              _registerButton(userService),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
        ),
      ),
    );
  }
}
