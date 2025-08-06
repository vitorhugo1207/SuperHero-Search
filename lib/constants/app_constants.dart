import 'package:flutter/material.dart';

abstract class AppConstants {
  static const int boxImgSize = 50;
  static const int boxImgSizeBig = 200;
  static const TextStyle fontBold = TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
  static const TextStyle fontNormal = TextStyle(fontSize: 16);
  static const EdgeInsets paddingInitial = EdgeInsets.all(16.0);
  static const SizedBox spaceMedium = SizedBox(height: 20);
  static const SizedBox spaceSmall = SizedBox(height: 10);
  static const String database = 'superhero_database.db';
}
