import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ProfileImageUpload extends StatefulWidget {
  @override
  _ProfileImageUploadState createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {
  File sampleImage;
  String url;
  bool isloading = false;
  double x = 0.0;

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    //meka depricated wela aluth eka daganin
    setState(() {
      sampleImage = tempImage;
    });
  }

  Future<bool> fileupload(BuildContext context) async {
    setState(() {
      isloading = false;
    });

    String filename = basename(sampleImage.path);

    try {
      final StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("UserImages").child(filename);
      final StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);

      final StorageTaskSnapshot downloadUrl = (await task.onComplete);

      var x = (await downloadUrl.ref.getDownloadURL());

      setState(() {
        isloading = true;
        url = x;
      });

      print('Succesfully Uploaded');
      print(url);
      _showDialog(context);
      print(isloading);
    } catch (e) {
      print("Error");
      print(e);
    }

    return true;
  }

  DecorationImage _buildbackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
      image: AssetImage('assets/images/back.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: true,
        elevation: 1.0,
        leading: new IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue,
        ),
        title: SizedBox(
            height: 35.0, child: Image.asset("assets/images/insta_logo.png")),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: _buildbackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: sampleImage == null
              ? Text('Select an image')
              : enableUpload(context),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Success"),
          content:
              new Text("File uploaded Successfully.Click Save for Proceed..."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget enableUpload(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.file(sampleImage, height: 300.0, width: 300.0),
          RaisedButton(
            elevation: 7.0,
            child: Text('Upload'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              x = 1.0;
              print('uploaing');

              fileupload(context);
            },
          ),
          isloading == false
              ? Opacity(
                  child: CircularProgressIndicator(),
                  opacity: x,
                )
              : RaisedButton(
                  elevation: 7.0,
                  child: Text('Save'),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context, url);
                  })
        ],
      ),
    );
  }
}
