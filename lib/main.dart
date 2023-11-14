import 'package:flutter/material.dart';
import 'package:flutter_nba/home_page.dart';

// void main() {
//   runApp( MyApp());
// }
void main() {
  runApp(
    MaterialApp(home: MyApp()), // use materialapp
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
