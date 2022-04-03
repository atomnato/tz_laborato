import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tz_laborato/widgets/homework_board_screen.dart';
import 'package:tz_laborato/widgets/utils/colors.dart';

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
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: kWhiteColor,
          displayColor: kWhiteColor,
        ),
      ),
      home: const HomeworkBoardScreen(),
    );
  }
}
