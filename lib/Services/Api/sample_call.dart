import 'package:aha_app/Models/bibleModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class SampleApi extends StatefulWidget {
  SampleApi({Key key}) : super(key: key);

  @override
  _SampleApiState createState() => _SampleApiState();
}

class _SampleApiState extends State<SampleApi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  makeRequest();
  }
  

  @override
  Widget build(BuildContext context) {
    //https://ajith-holy-bible.p.rapidapi.com/GetVerseOfaChapter?Verse=16&Book=john&chapter=3

    return Scaffold(
      body: Container(),
    );
  }
}
