import 'dart:convert';

import 'package:fluent_books_author/Methods/LanguageModel.dart';
import 'package:fluent_books_author/Models/MapModel.dart';
import 'package:fluent_books_author/Methods/Validation.dart';
import 'package:fluent_books_author/Models/RegistrationModel.dart';
import 'package:fluent_books_author/Models/SlotModel.dart';
import 'package:fluent_books_author/services/Api.dart';
import 'package:fluent_books_author/services/SharedPref.dart';
import 'package:fluent_books_author/services/Urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/DropMenuModel.dart';

class AuthCtrl extends GetxController {
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passLogin = TextEditingController();
  final RegistrationModel regData =
      RegistrationModel(docList: [], addressDetail: AddressDetails());
  final btnCtrl = AuthBtnModel();
  final List<LanguageModel> langList = [];
  final List<DropMenuModel> langLabel1 = [];
  final List<DropMenuModel> langLabel2 = [];
  final List<DropMenuModel> langLabel3 = [];
  final List<SlotModel> mainSlotList = [];
  String stepType = '';

  login(callBack) async {
    if (isEmail(emailLogin.text) && isPassword(passLogin.text)) {
      btnCtrl.login = false;
      update();
      var url =
          '${Urls.index}act=login&email=${emailLogin.text}&pass=${passLogin.text}';
      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              print(body);

            //   {
            //     "status":"success",
            // "userid":"17",
            // "fname":"email1",
            // "email":"email.1@gmail.com",
            // "proPic":"https:\/\/algowid.net\/fluent\/api\/files\/profile\/a956cf04ebb424c4c63663aea02b5df1.jpg",
            // "steps":"6",
            // "msg":"Logged in Successfully.",
            // "error":[
            // "Logged in Successfully."
            // ]
            // }
















              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  Map<String,dynamic> map = {
                    'msg':msg,
                    'step': data['steps'],
                  };

                  callBack(true, map, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.login = true;

      update();
    } else {
      callBack(false, null, 'Please enter valid email and password');
    }
    // https://www.algowid.net/fluent/api/index.php?act=login&email=algowid2019@gmail.com&pass=123123
  }

  register(callBack) async {
    var email = regData.email;
    var phone = regData.phoneNo;

    if (isEmail(email) && isPhone(phone)) {
      btnCtrl.contDetail = false;
      update();
      var url = '${Urls.index}act=register&email=$email&phone=$phone';
      await getMethod(
          url: url,
          callBack: (statusCode, body, error) {
            if (body != null) {

              Map<String, dynamic> data = jsonDecode(body);
              var status = data['status'];
              if (statusCode == 200) {
                if (status == 'success') {
                  var uid = data['usrid'];
                  setUid(uid.toString());
                  regData.otp = data['otp'].toString();
                  var msg = data['msg'];
                  callBack(true, msg, null);
                } else {
                  var error = data['error'][0];
                  callBack(false, null, error);
                }
              } else {
                callBack(false, null, 'Something went wrong :: $statusCode');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.contDetail = true;
      update();
    } else {
      callBack(false, null, 'Please enter valid email and phone no');
    }
  }

  otpVerification(callBack) async {
    var uid = await getUid();
    var otp = regData.otp;
    var url = '${Urls.index}act=otpVerify&authid=$uid&otp=$otp';
    if (isOTP(otp)) {
      btnCtrl.otp = false;
      update();
      await getMethod(
          url: url,
          callBack: (statusCode, body, error) {
            if (body != null) {
              if (statusCode == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                if (data['status'] == 'success') {
                  var msg = data['error'][0];
                  callBack(true, msg, null);
                } else {
                  var error = data['error'][0];
                  callBack(false, null, error);
                }
              } else {
                callBack(false, null, 'Something went wrong :: $statusCode');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.otp = true;
      update();
    } else {
      callBack(false, null, 'Please enter valid otp');
    }
  }

  updateName(callBack) async {
    var uid = await getUid();
    var fName = regData.firstName;
    var lName = regData.lastName;
    if (isName(fName)) {
      btnCtrl.crtAcc = false;
      update();
      var url =
          '${Urls.index}act=updateName&authid=$uid&fname=$fName&lname=$lName';
      await getMethod(
          url: url,
          callBack: (statusCode, body, error) {
            if (body != null) {
              if (statusCode == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                if (data['status'] == 'success') {
                  var msg = data['error'][0];
                  callBack(true, msg, null);
                } else {
                  var error = data['error'][0];
                  callBack(false, null, error);
                }
              } else {
                callBack(false, null, 'Something went wrong :: $statusCode');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.crtAcc = true;
      update();
    } else {
      callBack(false, null, 'Please enter a valid user name');
    }
  }

  updatePassword(callBack) async {
    var uid = await getUid();
    var pass = regData.password;
    var rePass = regData.rePassword;
    var isPass = isPassword(pass);

    if (isPass && pass.compareTo(rePass) == 0) {
      btnCtrl.password = false;
      update();
      var url =
          '${Urls.index}act=updatePass&authid=$uid&pass=$pass&repass=$rePass';

      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
            btnCtrl.password = true;
            update();
          });
    } else {
      if (isPass) {
        callBack(false, null, 'Please enter valid password');
      } else {
        callBack(false, null, 'Password not matched');
      }
    }
  }

  updateAbout(callBack) async {
    var uid = await getUid();
    var about = regData.about;
    var url = '${Urls.index}act=updateAbout&authid=$uid&about=$about';
    if (about.trim().isNotEmpty) {
      btnCtrl.about = false;
      update();
      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.about = true;
      update();
    } else {
      callBack(false, null, 'empty');
    }
  }

  uploadImage(callBack) async {
    if (regData.photo.isNotEmpty) {
      btnCtrl.uploadIcon = false;
      update();
      var uid = await getUid();
      var url = '${Urls.index}act=profilePicUpdate&authid=$uid';
      List<MapModel> img = [];
      img.add(MapModel(key: 'image', value: regData.photo));

      await multiPartMethod(
          url: url,
          images: img,
          callBack: (status, body, error) {
            if (body != null) {
              if (kDebugMode) {
                print('response :: $body');
              }
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.uploadIcon = true;
      update();
    } else {
      callBack(false, null, 'please select image');
    }
  }

  forgotPassword(var email, callBack) async {
    if (isEmail(email)) {
      btnCtrl.forgot = false;
      update();
      var url = '${Urls.index}act=forgotPass&email=$email';
      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.forgot = true;
      update();
    } else {
      callBack(false, null, 'please enter valid email');
    }
  }

  updateAddress(callBack) async {
    // https://www.algowid.net/fluent/api/index.php?act=updateAddress&authid=1&address=DemoAddress&city=Mohali&state=Punjab&zip=160088&country=India
    var uid = await getUid();
    AddressDetails adr = regData.addressDetail;

    if (adr.address.isNotEmpty &&
        adr.country.isNotEmpty &&
        adr.zipCode.isNotEmpty &&
        adr.state.isNotEmpty &&
        adr.city.isNotEmpty) {
      btnCtrl.address = false;
      update();
      var url =
          '${Urls.index}act=updateAddress&authid=$uid&address=${adr.address}&city=${adr.city}&state=${adr.state}&zip=${adr.zipCode}&country=${adr.country}';

      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.address = true;
      update();
    } else {
      callBack(false, null, 'Fields are empty');
    }
  }

  payInfo(callBack) async {
    var uid = await getUid();

    var email = regData.payEmail;
    var phone = regData.payPhoneNo;

    if (isEmail(email) && isPhone(phone)) {
      btnCtrl.payInfo = false;
      update();
      var url =
          '${Urls.index}act=updateEpay&authid=$uid&payemail=$email&payphone=$phone';

      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  if (kDebugMode) {
                    print(body);
                  }
                  //{"status":"success","authID":"21","email":"email@gmail.com","step":8,"error":["ePayment Info Updated"]}
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
      btnCtrl.payInfo = true;
      update();
    } else {
      callBack(false, null, 'Please enter valid email and phone no');
    }
  }

  getLangList(callBack) async {
    btnCtrl.langLoader = true;
    update();
    var url = '${Urls.index}act=langList';

    await getMethod(
        url: url,
        callBack: (status, body, error) {
          if (body != null) {
            if (kDebugMode) {
              print(body);
            }
            if (status == 200) {
              List<dynamic> list = jsonDecode(body);
              langList.clear();
              langList.addAll(List<LanguageModel>.from(
                  list.map((e) => LanguageModel.fromJson(e))));
              setLangLabel1();
              callBack(true, '', null);
            } else {
              callBack(false, null, 'Something went wrong : $status');
            }
          } else {
            callBack(false, null, error);
          }
        });
    btnCtrl.langLoader = false;
    update();
  }

  setLangLabel1() {
    langLabel1.clear();
    for (var item in langList) {
      langLabel1.add(DropMenuModel(label: item.name, value: item.langId));
    }
    regData.primaryLang = langLabel1[0];
    langLabel2.clear();
    langLabel3.clear();
    regData.tertiaryLang = null;
    regData.secondaryLang = null;
    update();
  }

  setLang({var type, required DropMenuModel lang}) {
    List<DropMenuModel> listCopy = [];
    if (type == 1) {
      regData.primaryLang = lang;
      listCopy.addAll(langLabel1);
      listCopy.remove(lang);
      langLabel2.clear();
      langLabel3.clear();
      langLabel2.addAll(listCopy);
      listCopy.clear();
      regData.secondaryLang = langLabel2[0];
      regData.tertiaryLang = null;
    } else if (type == 2) {
      regData.secondaryLang = lang;
      listCopy.addAll(langLabel2);
      listCopy.remove(lang);
      langLabel3.clear();
      langLabel3.addAll(listCopy);
      listCopy.clear();
      regData.tertiaryLang = langLabel3[0];
    } else {
      regData.tertiaryLang = lang;
    }
    update();
  }

  updateLang( callBack) async {
    var uid = await getUid();

    if(regData.primaryLang != null && regData.secondaryLang != null && regData.tertiaryLang != null){
      btnCtrl.lang = false;
      update();
      var url =
          '${Urls.index}act=updateLang&authid=$uid&lang1=${regData.primaryLang!.value}&lang2=${regData.secondaryLang!.value}&lang3=${regData.tertiaryLang!.value}';
      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });

      btnCtrl.lang = true;
      update();
    }else{
      callBack(false,null,'Please select language');
    }

  }

  timeSlot(callBack) async {
    var url = '${Urls.index}act=timeList';
    await getMethod(
        url: url,
        callBack: (status, body, error) {
          if (body != null) {
            if (status == 200) {
              print(body);
              List<dynamic> list = jsonDecode(body);
              mainSlotList.clear();
              mainSlotList.addAll(List<SlotModel>.from(list.map((e) => SlotModel.fromJson(e))));
            } else {
              callBack(false, null, 'Something went wrong : $status');
            }
          } else {
            callBack(false, null, error);
          }
        });

    update();
  }

  interviewRequest(callBack) async {
    if(regData.meetDate.isNotEmpty && regData.meetTime.isNotEmpty){
      btnCtrl.interview = false;
      update();
      var uid = await getUid();
      var url =
          '${Urls.index}act=updateInterview&authid=$uid&dt=${regData.meetDate}&slot=${regData.meetTime}';

      await getMethod(
          url: url,
          callBack: (status, body, error) {
            if (body != null) {
              if (status == 200) {
                Map<String, dynamic> data = jsonDecode(body);
                var msg = data['error'][0];
                if (data['status'] == 'success') {
                  callBack(true, msg, null);
                } else {
                  callBack(false, null, msg);
                }
              } else {
                callBack(false, null, 'Something went wrong : $status');
              }
            } else {
              callBack(false, null, error);
            }
          });
    }else{
      callBack(false,null,'Please select date and time');
    }
    btnCtrl.interview = true;
    update();

  }
}

class AuthBtnModel {
  bool login;
  bool forgot;
  bool address;
  bool cardDetail;
  bool about;
  bool contDetail;
  bool crtAcc;
  bool password;
  bool payInfo;
  bool doc;
  bool lang;
  bool interview;
  bool uploadIcon;
  bool otp;
  bool langLoader;
  bool interviewLoader;

  AuthBtnModel({
    this.login = true,
    this.forgot = true,
    this.address = true,
    this.cardDetail = true,
    this.about = true,
    this.contDetail = true,
    this.crtAcc = true,
    this.password = true,
    this.payInfo = true,
    this.doc = true,
    this.lang = true,
    this.interview = true,
    this.uploadIcon = true,
    this.otp = true,
    this.langLoader = false,
    this.interviewLoader = false,
  });
}
