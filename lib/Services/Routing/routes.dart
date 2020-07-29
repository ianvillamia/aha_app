import 'package:aha_app/Screens/aha_body.dart';
import 'package:aha_app/Screens/evening_devo.dart';
import 'package:aha_app/Screens/homepage.dart';
import 'package:aha_app/Screens/morning_devo.dart';
import 'package:aha_app/Screens/notesList.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FluroRouter {
  static Router router = Router();
  // static Handler _loginHandler = Handler(
  //   handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //       Login());
  static Handler _homepageHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          Homepage());
  static Handler _morningDevotionHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MorningDevotion());
  static Handler _eveningDevotionHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          EveningDevotion());
  static Handler _notesListHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          NoteList());
  static Handler _noteBodyHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AhaBody());
  // static Handler _loadingHandler = Handler(
  //   handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //       Loading());
  static void setupRouter() {
    // router.define("/login", handler: _loginHandler, transitionType: TransitionType.inFromRight,);
    router.define(
      "/home",
      handler: _homepageHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      "/morningDevo",
      handler: _morningDevotionHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      "/eveningDevo",
      handler: _eveningDevotionHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      "/notesList",
      handler: _notesListHandler,
      transitionType: TransitionType.cupertino,
    );
    router.define(
      "/noteBody",
      handler: _noteBodyHandler,
      transitionType: TransitionType.cupertino,
    );
  }
}
