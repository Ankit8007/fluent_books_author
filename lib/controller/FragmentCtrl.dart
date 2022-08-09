import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/AboutUs.dart';
import '../src/BookShelf.dart';
import '../src/ContactUs.dart';
import '../src/NewsLetter.dart';
import '../src/Notifications.dart';
import '../src/Payments.dart';
import '../src/Profile.dart';
import '../src/Settings.dart';

class FragmentCtrl extends GetxController{
  Widget currentScreen = const BookShelf();
  onMenuAction(int index){
    switch (index){
      case 0:
        currentScreen = const BookShelf();
        break;
      case 1:
        currentScreen = const Payments();
        break;
      case 2:
        currentScreen = const NewsLetter();
        break;
      case 3:
        currentScreen = const Profile();
        break;
      case 4:
        currentScreen = const Notifications();
        break;
      case 5:
        currentScreen = const Settings();
        break;
      case 6:
        currentScreen = const AboutUs();
        break;
      case 7:
        currentScreen = const ContactUs();
        break;

    }

    update();
  }
}