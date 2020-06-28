import 'package:Team_Furious/Models/user_model.dart';
import 'package:Team_Furious/insta_home.dart';
import 'package:Team_Furious/profile.dart';
import 'package:Team_Furious/services/orderService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderService()),
        ChangeNotifierProvider(create: (context) => User()),
      ],
      child: MaterialApp(
        title: 'Instagram',
        routes: <String, WidgetBuilder>{
          '/dashboard': (BuildContext context) => new InstaHome(),
          '/profile': (BuildContext context) => new ProfileManagement(),
        },
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
            textTheme: TextTheme(title: TextStyle(color: Colors.black))),
        home: new Login(),
      ),
    );
  }
}
