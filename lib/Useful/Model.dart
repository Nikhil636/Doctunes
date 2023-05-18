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

class FeaturesModel {
  String BgImg;
  String Title;
  IconData ImgIcon;
  FeaturesModel(this.BgImg, this.Title, this.ImgIcon);

}
class FilesModel {
  String Title;
  String SubTitle;
  String ImgFileType;
  FilesModel(this.Title,this.SubTitle,this.ImgFileType);
}