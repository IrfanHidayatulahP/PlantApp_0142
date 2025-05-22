import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/components/home_screen.dart';

void main() {
  String alamat = ""; // Replace with your desired default value
  runApp(MyApp(alamat: alamat));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key, 
    required this.alamat
  });

  final String alamat;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(alamat: alamat),
    );
  }
}
