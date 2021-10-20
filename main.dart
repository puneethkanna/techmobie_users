import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(const TechMobie());
}

Color lightColorTechMobie = const Color(0xFFE3FFFA);

class TechMobie extends StatelessWidget {
  const TechMobie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechMobie',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          foregroundColor: Color(0xFFE3FFFA),
          backgroundColor: Colors.black,
          toolbarTextStyle: TextStyle(
            color: Color(0xFFE3FFFA),
          ),
        ),
        scaffoldBackgroundColor: /*Color(0xFFE1E1E1F),*/ Colors.black,
        cardColor: const Color(0xFFD2C2C30), //Colors.grey.shade900,
        //indicatorColor: Colors.green,
        //primaryColor: Colors.black87,
        visualDensity: VisualDensity.compact,
      ),
      //theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Tech Mobie'),
    );
  }
}
