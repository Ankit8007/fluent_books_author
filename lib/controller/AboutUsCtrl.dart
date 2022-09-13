import 'dart:convert';

import 'package:fluent_books_author/services/Api.dart';
import 'package:fluent_books_author/services/Urls.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AboutUsCtrl extends GetxController {
  String termsCondition = '';
  String privacyPolicy = '';
  String aboutUs = '';
  bool loader = false;


  getData({var pageId}) async {
    var url = '${Urls.index}act=pageList&pageid=$pageId';
    loader = true;
    update();
    await getMethod(
        url: url,
        callBack: (status, body, error) {
          if (body != null) {
            if (status == 200) {
              Map<String, dynamic> data = jsonDecode(body);
              switch (pageId) {
                case 1:
                  termsCondition = data['pgTxt'];
                  break;
                case 2:
                  privacyPolicy = data['pgTxt'];
                  break;
                case 3:
                  aboutUs = data['pgTxt'];
                  break;
                default:
                  break;
              }
            } else {
              if (kDebugMode) {
                print(error);
              }
            }
          } else {
            if (kDebugMode) {
              print(error);
            }
          }
        });

    loader = false;
    update();
  }
}
