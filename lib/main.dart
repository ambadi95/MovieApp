import 'package:flutter/material.dart';
import 'package:movie_app/Screens/splash_screen.dart';

import 'Database/local_database.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper databaseHelper = new DatabaseHelper();
  databaseHelper.initializeDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

