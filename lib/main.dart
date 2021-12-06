import 'package:flutter/material.dart';
import 'package:flutter_web/Intro_To_Material_Design/appBar.dart';
import 'package:flutter_web/Intro_To_Material_Design/drawerDemo.dart';
import 'package:flutter_web/Intro_To_Material_Design/information_displays.dart';
import 'package:flutter_web/screens/favorites.dart';
import 'package:flutter_web/screens/home.dart';
import 'package:provider/provider.dart';

import 'Intro_To_Material_Design/bottom_nav_bar_Demo.dart';
import 'Intro_To_Material_Design/buttons_demo.dart';
import 'Intro_To_Material_Design/dialog_alerts.dart';
import 'Intro_To_Material_Design/input_and_selections.dart';
import 'Intro_To_Material_Design/layouts.dart';
import 'models/favorites.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
