import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF36427D),
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Container(),
    );
  }
}
