import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';
import 'package:quiz_app/utlis/color_constants.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentindex = 0;
  int length = Dummydb.questionlist.length;
  int? selectedanswerindex;
  int? answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 56, 97),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 56, 97),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "${currentindex + 1} / ${Dummydb.questionlist.length}",
              style: TextStyle(
                fontSize: 20,
                color: ColorConstants.Textcolor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorConstants.Backgroundcolor),
                child: Center(
                  child: Text(
                    Dummydb.questionlist[currentindex]["question"],
                    style: TextStyle(
                        color: ColorConstants.Textcolor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: () {
                      selectedanswerindex = index;
                      setState(() {
                        print(selectedanswerindex);
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          color: ColorConstants.Backgroundcolor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: getcolor(index))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Dummydb.questionlist[currentindex]["options"]
                                [index],
                            style: TextStyle(
                                color: ColorConstants.Textcolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: ColorConstants.Textcolor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            selectedanswerindex == null
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      selectedanswerindex = null;
                      setState(() {});
                      if (currentindex < Dummydb.questionlist.length - 1) {
                        currentindex++;
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                      rightanswercount: 7,
                                    )));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorConstants.Wronganswercolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: ColorConstants.Textcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Color getcolor(int currentoptionindex) {
    if (selectedanswerindex != null &&
        currentoptionindex ==
            Dummydb.questionlist[currentindex]["answerindex"]) {
      return Colors.green;
    }
    if (selectedanswerindex == currentoptionindex) {
      if (selectedanswerindex ==
          Dummydb.questionlist[currentindex]["answerindex"]) {
        return ColorConstants.Rightanswercolor;
      } else {
        return ColorConstants.Wronganswercolor;
      }
    } else {
      return ColorConstants.Questionscolor;
    }
  }
}
