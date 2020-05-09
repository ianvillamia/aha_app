import 'package:flutter/foundation.dart';
class BibleModel{
  final String book;
  final String chapter;
  final String output;
  BibleModel({
   @required this.book,@required this.chapter, @required this.output
  });

  factory BibleModel.fromJson(Map<String,dynamic>json){
    return BibleModel(
      book: json['Book'] as String,
  chapter: json['Chapter'] as String,
  output: json['Output']as String
    );
  }
}