import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_skills/model/Situation.dart';

class Data {
  static  List<Situation> a1Situations = [Situation("text", "question", "correctAnswer", "a1", "a2", "a3", Image.asset("image1.svg")),
    Situation("text2", "question2", "correctAnswer2", "a1", "a2", "a3", Image.asset("iPhone 13, 12 Pro Max – 1"))];
  static  List<Situation> a2Situations = [Situation("2text", "question", "correctAnswer", "a1", "a2", "a3", Image.asset("image1")),
    Situation("2text2", "question2", "correctAnswer2", "a1", "a2", "a3", Image.asset("image1"))];
  static  List<Situation> a3Situations = [Situation("2text", "question", "correctAnswer", "a1", "a2", "a3", Image.asset("image1")),
    Situation("2text2", "question2", "correctAnswer2", "a1", "a2", "a3", Image.asset("image1"))];
  static  List<Situation> a4Situations = [];
  static  List<Situation> a5Situations = [];
  static  List<Situation> a6Situations = [];
  static  List<Situation> a7Situations = [];
  static  List<Situation> a8Situations = [];
  static  List<Situation> a9Situations = [];
  static  List<Situation> a10Situations = [];
  static  List<Situation> a11Situations = [];
  static  List<Situation> a12Situations = [];
  static  List<Situation> a13Situations = [];
  static  List<Situation> a14Situations = [];
  static  List<Situation> a15Situations = [];

  static List<List<Situation>> activities = [a1Situations,a2Situations,a3Situations,a4Situations,a5Situations,a6Situations,
    a7Situations,a8Situations,a9Situations,a10Situations,a11Situations,a12Situations,a13Situations,a14Situations,a15Situations];

 }