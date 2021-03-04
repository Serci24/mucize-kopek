import 'package:dog_api/widgets/home_screen.dart';
import 'package:flutter/material.dart';

// import 'flushbar-demo/flushbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("her şey yeniden oluşturuldu !!!");
    return MaterialApp(
      title: "Good Dog",
      home: HomeScreen(),
    );
  }
}
