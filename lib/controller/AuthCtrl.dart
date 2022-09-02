import 'dart:convert';

import 'package:fluent_books_author/Methods/Validation.dart';
import 'package:fluent_books_author/Models/RegistrationModel.dart';
import 'package:fluent_books_author/services/Api.dart';
import 'package:fluent_books_author/services/SharedPref.dart';
import 'package:fluent_books_author/services/Urls.dart';
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

  register(callBack) async{
    var email = regData.email;
    var phone = regData.phoneNo;
    if(isEmail(email) && isPhone(phone)){
      var url = '${Urls.index}act=register&email=$email&phone=$phone';
      getMethod(url: url,callBack: (statusCode, body, error){
        if(body != null){
          Map<String,dynamic> data = jsonDecode(body);
          var status = data['status'];
          if(statusCode == 200){
            if(status == 'success'){
              var uid = data['usrid'];
              setUid(uid);
              regData.otp = data['otp'];
              var msg = data['msg'];
              callBack(true,msg,null);
            }else{
              var error = data['error'][0];
              callBack(false,null, error);
            }
          }else{
            callBack(false, null, 'Something went wrong :: $statusCode');
          }

        }else{
          callBack(false,null,error);
        }
      });
    }


  }

  otpVerification(callBack) async{
    var uid = await getUid();
    var otp = regData.otp;
    var url = '${Urls.index}act=otpVerify&authid=$uid&otp=$otp';
    getMethod(url: url, callBack: (statusCode,body,error) {
      if(body != null){
        if(statusCode == 200){
          Map<String,dynamic> data = jsonDecode(body);
          if(data['status'] == 'success'){
            var msg = data['error'][0];
            callBack(true,msg,null);
          }else{
            var error = data['error'][0];
            callBack(false,null,error);
          }
        }else{
          callBack(false,null,'Something went wrong :: $statusCode');
        }
      }else{
        callBack(false,null,error);
      }
    });
  }

  updateName(callBack) async{
    var uid = await getUid();
    var fName = regData.firstName;
    var lName = regData.lastName;
    if(isName(fName)){
      var url = '${Urls.index}act=updateName&authid=$uid&fname=$fName&lname=$lName';
      getMethod(url: url, callBack: (statusCode,body,error){
        if(body != null){
          if(statusCode == 200){
            Map<String,dynamic> data = jsonDecode(body);
            if(data['status'] == 'success'){
              var msg = data['error'][0];
              callBack(true,msg,null);
            }else{
              var error = data['error'][0];
              callBack(false,null,error);
            }
          }else{
            callBack(false,null,'Something went wrong :: $statusCode');
          }
        }else{
          callBack(false,null,error);
        }

      });
    }

  }



}