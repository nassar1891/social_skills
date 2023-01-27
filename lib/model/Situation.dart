import 'package:flutter/cupertino.dart';
import 'package:social_skills/model/Situation.dart';

class Situation{
  String text, question, correctAnswer, a1, a2, a3;
  Image bgImage;

  Situation(this.text, this.question,this.correctAnswer, this.a1, this.a2, this.a3, this.bgImage);
}