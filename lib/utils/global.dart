import 'package:android_solution/pages/home_screen.dart';
import 'package:android_solution/pages/profile_screen.dart';
import 'package:android_solution/pages/scan_screen.dart';
import 'package:android_solution/pages/search_screen.dart';
import 'package:android_solution/pages/stat_screen.dart';
import 'package:flutter/material.dart';

List<Widget> navScreens =[
  HomeScreen(),//index 0
  SearchScreen(),
  ScanScreen(),
  StatisticsScreen(),
  ProfileScreen()//index 4
];

