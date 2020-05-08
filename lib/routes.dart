import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:aha_app/homepage.dart';

class FluroRouter {
  static Router router = Router();
  // static Handler _loginHandler = Handler(
  //   handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //       Login());
  static Handler _homepageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        Homepage());
  // static Handler _loadingHandler = Handler(
  //   handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //       Loading());
  static void setupRouter() {
    // router.define("/login", handler: _loginHandler, transitionType: TransitionType.inFromRight,);
    router.define("/home", handler: _homepageHandler);
    // router.define("/", handler: _loadingHandler);
  }
}