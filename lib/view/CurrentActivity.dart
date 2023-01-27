import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_skills/model/Situation.dart';
import 'package:social_skills/view/SelectActivity.dart';
import '../model/CustomWidgets.dart';

class CurrentActivity extends StatefulWidget {
  List<Situation> activity;
  int activityNumber;
  int activitiesFinished;
  int currentSituationNumber = 0;
  late Situation currentSituation;

  CurrentActivity({
    Key? key,
    required this.activity,
    required this.activityNumber,
    required this.activitiesFinished,
  }) : super(key: key);

  @override
  State<CurrentActivity> createState() => _CurrentActivityState();
}

class _CurrentActivityState extends State<CurrentActivity> {
  String? selectedAnswer;
  late List<String> answers;

  void setSelectedAnswer(String newAnswer) {
    selectedAnswer = newAnswer;
  }

  Future<void> showMyDialog(bool correct) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        if (correct) {
          return AlertDialog(
            title: const Text('أحسنت'),
            content: Image.asset("إجابة صحيحة"),
            actions: <Widget>[
              CustomButton(
                  onTap: () async {
                    debugPrint("current situation number : ${widget.currentSituationNumber}");
                    debugPrint("activities length - 1 : ${widget.activity.length - 1}");
                    debugPrint((widget.currentSituationNumber < widget.activity.length - 1).toString());
                    debugPrint("activities finished : ${widget.activitiesFinished}");
                    debugPrint("activity number : ${widget.activityNumber}");
                    debugPrint((widget.activitiesFinished < widget.activityNumber).toString());
                    if (widget.currentSituationNumber < widget.activity.length - 1) {
                      setState(() {
                        widget.currentSituationNumber++;
                      });
                      Navigator.of(context).pop();
                    } else {
                      if (widget.activitiesFinished <= widget.activityNumber) {
                        widget.activitiesFinished = widget.activityNumber + 1;
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setInt("finishedActivities", widget.activitiesFinished);
                      }
                      Navigator.of(context).pop();
                      showPuzzle();
                    }
                  },
                  text: "التالي"),
            ],
          );
        } else {
          return AlertDialog(
            title: const Text('حاول مجددا'),
            content: Lottie.asset("images/sad.json"),
            actions: <Widget>[
              TextButton(
                child: const Text('أغلق'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.currentSituation = widget.activity[widget.currentSituationNumber];
    answers = [
      widget.currentSituation.a1,
      widget.currentSituation.a2,
      widget.currentSituation.a3,
      widget.currentSituation.correctAnswer,
    ]..shuffle();
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text("${widget.activityNumber} نشاط"),
        ),
        body: Stack(
          children: [
            SvgPicture.asset(
              'images/image1.svg',
              fit: BoxFit.fill,
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    CustomButton(text: widget.currentSituation.text),
                    CustomButton(text: widget.currentSituation.question),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...{answers[0], answers[1]}.map<Widget>(
                          (String text) {
                            final bool isSelected = text == selectedAnswer;
                            final bool isCorrect = text == widget.currentSituation.correctAnswer;
                            return Expanded(
                              child: CustomButton(
                                text: text,
                                onTap: () {
                                  setSelectedAnswer(text);
                                  showMyDialog(isCorrect);
                                },
                                color: isSelected ? (isCorrect ? Colors.green : Colors.red) : Colors.grey,
                              ),
                            );
                          },
                        ).toList(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...{answers[2], answers[3]}.map<Widget>(
                          (String text) {
                            final bool isSelected = text == selectedAnswer;
                            final bool isCorrect = text == widget.currentSituation.correctAnswer;
                            return Expanded(
                              child: CustomButton(
                                text: text,
                                onTap: () {
                                  setSelectedAnswer(text);
                                  showMyDialog(isCorrect);
                                },
                                color: isSelected ? (isCorrect ? Colors.green : Colors.red) : Colors.grey,
                              ),
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> showPuzzle() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("تهانينا"),
            content: Image.asset("puzzle"),
            actions: <Widget>[
              TextButton(
                child: const Text('أغلق'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SelectActivity(activitiesFinished: widget.activitiesFinished)));
                },
              ),
            ],
          );
        });
  }
}
