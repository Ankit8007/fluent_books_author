import 'package:fluent_books_author/Methods/Validation.dart';
import 'package:fluent_books_author/Models/RegistrationModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCtrl extends GetxController{
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passLogin = TextEditingController();
  final RegistrationModel regData = RegistrationModel(docList: [], photos: [], addressDetail: AddressDetails());

  login(callBack)async{

    if(isEmail(emailLogin.text) && isPassword(passLogin.text)){
      callBack(true);
    }else{
      callBack(false);
    }

  }

  register(callBack) async{}



}