import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';
import 'package:quiz_app/utlis/color_constants.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.rightanswercount});
  final int rightanswercount;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starcount = 0;
  calculatestarcount() {
    var percentage =
        (widget.rightanswercount / Dummydb.questionlist.length) * 100;

    if (percentage >= 80) {
      starcount = 3;
    } else if (percentage >= 50) {
      starcount = 2;
    } else if (percentage >= 30) {
      starcount = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              3,
              (index) => Icon(
                    Icons.star,
                    color: index <= 0
                        ? ColorConstants.Goldenyellowcolor
                        : Colors.grey,
                    size: index == 1 ? 80 : 40,
                  )),
        ),
        SizedBox(height: 20),
        Text(
          "Congratulations",
          style: TextStyle(
            color: ColorConstants.Goldenyellowcolor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Your Score",
          style: TextStyle(
              color: ColorConstants.Textcolor,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "6/13",
            style: TextStyle(
                color: ColorConstants.Goldenyellowcolor,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(),
                    ));
              });
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.Textcolor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.replay,
                              color: ColorConstants.Textcolor)),
                      SizedBox(width: 10),
                      Text("Retry", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
