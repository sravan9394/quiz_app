import 'package:flutter/material.dart';
import 'package:quiz_app/utlis/color_constants.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorConstants.Backgroundcolor),
      home: QuestionScreen(),
    );
  }
}
