import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_skills/model/CustomWidgets.dart';
import 'package:social_skills/view/SelectActivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint((await getApplicationSupportDirectory()).path);
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final int finishedActivities = sharedPreferences.getInt("finishedActivities") ?? 1;
  debugPrint('Finished Activies: $finishedActivities');
  runApp(
    MyApp(
      finishedActivities: finishedActivities,
    ),
  );
}

class MyApp extends StatelessWidget {
  final int finishedActivities;
  const MyApp({Key? key, required this.finishedActivities}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Social skills',
        finishedActivities: finishedActivities,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // welcome page
  final String title;
  final int finishedActivities;
  const MyHomePage({
    Key? key,
    required this.title,
    required this.finishedActivities,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SelectActivity(activitiesFinished: widget.finishedActivities),
                  ),
                );
              },
              text: ('ابدأ اللعبة'),
            ),
          ),
        ),
      ),
    );
  }
}
