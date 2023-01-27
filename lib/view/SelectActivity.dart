import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_skills/model/Situation.dart';
import '../model/CustomWidgets.dart';
import 'CurrentActivity.dart';
import 'package:social_skills/model/Data.dart';
import 'package:social_skills/model/Data.dart';

class SelectActivity extends StatefulWidget {
  // welcome page
  SelectActivity({Key? key, required this.activitiesFinished}) : super(key: key);
  int activitiesFinished;

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  List<Widget> activityWidgets = [];

  void addActivities() {
    for (int i = 1; i <= 15; i++) {
      activityWidgets.add(
        AbsorbPointer(
          absorbing: widget.activitiesFinished < i ? true : false,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CurrentActivity(
                      activity: Data.activities[i - 1],
                      activityNumber: i,
                      activitiesFinished: widget.activitiesFinished,
                    ),
                  ),
                );
              },
              text: " نشاط $i",
              color: Colors.deepOrange,
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    addActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text("الأنشطة"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            "images/image1.svg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    activityWidgets[0],
                    activityWidgets[1],
                    const SizedBox(),
                    activityWidgets[2],
                    const SizedBox(),
                    activityWidgets[3],
                    const SizedBox(),
                    activityWidgets[4],
                    const SizedBox(),
                    activityWidgets[5],
                    const SizedBox(),
                    activityWidgets[6],
                    const SizedBox(),
                    activityWidgets[7],
                    const SizedBox(),
                    activityWidgets[8],
                    const SizedBox(),
                    activityWidgets[9],
                    const SizedBox(),
                    activityWidgets[10],
                    const SizedBox(),
                    activityWidgets[11],
                    const SizedBox(),
                    activityWidgets[12],
                    const SizedBox(),
                    activityWidgets[13],
                    activityWidgets[14],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
