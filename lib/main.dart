import 'package:flutter/material.dart';
import 'package:bloc_example/app.dart';
import 'package:bloc_example/utils/injector.dart';

void main() {
  InjectionInit.init();
  runApp(MyApp());
}