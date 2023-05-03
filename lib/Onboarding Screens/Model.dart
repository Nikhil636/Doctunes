import 'package:flutter/cupertino.dart';

class LanguageModel {
  String flagImage;
  String language;
  bool isSelected;
  LanguageModel(this.flagImage, this.language, this.isSelected);
}

class QuestionModel {
  String img;
  String title;
  bool isSelected;
  QuestionModel(this.img, this.title, this.isSelected);
  String getAnswer() {
    return title;
  }
}



