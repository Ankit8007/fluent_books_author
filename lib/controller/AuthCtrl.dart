import 'dart:convert';

import 'package:fluent_books_author/Models/MapModel.dart';
import 'package:fluent_books_author/Methods/Validation.dart';
import 'package:fluent_books_author/Models/RegistrationModel.dart';
import 'package:fluent_books_author/services/Api.dart';
import 'package:fluent_books_author/services/SharedPref.dart';
import 'package:fluent_books_author/services/Urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthCtrl extends GetxController{
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passLogin = TextEditingController();
  final RegistrationModel regData = RegistrationModel(docList: [], addressDetail: AddressDetails());

  login(callBack)async{

    if(isEmail(emailLogin.text) && isPassword(passLogin.text)){
      var url = '${Urls.index}act=login&email=${emailLogin.text}&pass=${passLogin.text}';
      await getMethod(url: url,callBack: (status,body,error){
        if(body != null){
          if(status == 200){
            Map<String,dynamic> data = jsonDecode(body);
            var msg = data['error'][0];
            if(data['status'] == 'success'){
              callBack(true,msg,null);
            }else{
              callBack(false,null,msg);
            }
          }else{
            callBack(false,null,'something went wrong : $status');
          }
        }else{
          callBack(false,null,error);
        }
      });
    }else{
      callBack(false,null,'Please enter valid email and password');
    }
    // https://www.algowid.net/fluent/api/index.php?act=login&email=algowid2019@gmail.com&pass=123123


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
              setUid(uid.toString());
              regData.otp = data['otp'].toString();
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
    }else{
      callBack(false,null,'Please enter valid email and phone no');
    }


  }

  otpVerification(callBack) async{
    var uid = await getUid();
    var otp = regData.otp;
    var url = '${Urls.index}act=otpVerify&authid=$uid&otp=$otp';
    if(isOTP(otp)){
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
    }else{
      callBack(false,null,'Please enter valid otp');
    }

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
    }else{
      callBack(false,null,'Please enter a valid user name');
    }

  }

  updatePassword(callBack)async{
    var uid = await getUid();
    var pass = regData.password;
    var rePass = regData.rePassword;
    var isPass = isPassword(pass);

    if(isPass && pass.compareTo(rePass) == 0){
      var url = '${Urls.index}act=updatePass&authid=$uid&pass=$pass&repass=$rePass';

      getMethod(url: url,callBack: (status,body,error){
        if(body != null){
          if(status == 200){
            Map<String,dynamic> data = jsonDecode(body);
            var msg = data['error'][0];
            if(data['status'] == 'success'){
              callBack(true,msg,null);
            }else{
              callBack(false,null,msg);
            }
          }else{
            callBack(false,null,'Something went wrong : $status');
          }

        }else{
          callBack(false,null,error);
        }

      });
    }else{
      if(isPass){
        callBack(false,null,'Please enter valid password');
      }else{
        callBack(false,null,'Password not matched');
      }
    }


  }

  updateAbout(callBack)async{
    var uid = await getUid();
    var about = regData.about;
    var url = '${Urls.index}act=updateAbout&authid=$uid&about=$about';
    if(about.trim().isNotEmpty){
      getMethod(url: url,callBack: (status,body,error){
        if(body != null){
          if(status == 200){
            Map<String,dynamic> data = jsonDecode(body);
            var msg = data['error'][0];
            if(data['status'] == 'success'){
              callBack(true,msg,null);
            }else{
              callBack(false,null,msg);
            }
          }else{
            callBack(false,null,'Something went wrong : $status');
          }
        }else{
          callBack(false,null,error);
        }
      });
    }else{
      callBack(false,null,'empty');
    }
  }

  uploadImage(callBack)async{
    var uid = await getUid();
    var url = '${Urls.index}act=profilePicUpdate&authid=$uid';
    List<MapModel> img = [];
    img.add(MapModel(key: 'image',value: regData.photo));

    multiPartMethod(url: url,images: img,callBack: (status,body,error){
      if(body != null){
        if (kDebugMode) {
          print('response :: $body');
        }
        if(status == 200){
          Map<String,dynamic> data = jsonDecode(body);
          var msg = data['error'][0];
          if(data['status'] == 'success'){
            callBack(true,msg,null);
          }else{
            callBack(false,null,msg);
          }
        }else{
          callBack(false,null,'Something went wrong : $status');
        }
      }else{
        callBack(false,null,error);
      }
    });
  }

  forgotPassword(var email,callBack)async{
    if(isEmail(email)){
      var url = '${Urls.index}act=forgotPass&email=$email';
      getMethod(url: url,callBack: (status,body,error){
        if(body != null){
          if(status == 200){
            Map<String,dynamic> data = jsonDecode(body);
            var msg = data['error'][0];
            if(data['status'] == 'success'){
              callBack(true,msg,null);
            }else{
              callBack(false,null,msg);
            }
          }else{
            callBack(false,null,'Something went wrong : $status');
          }
        }else{
          callBack(false,null,error);
        }
      });
    }else{
      callBack(false,null,'please enter valid email');
    }

  }

  updateAddress(callBack) async{
    // https://www.algowid.net/fluent/api/index.php?act=updateAddress&authid=1&address=DemoAddress&city=Mohali&state=Punjab&zip=160088&country=India
    var uid = await getUid();
    AddressDetails adr = regData.addressDetail;

    if(adr.address.isNotEmpty && adr.country.isNotEmpty && adr.zipCode.isNotEmpty && adr.state.isNotEmpty && adr.city.isNotEmpty){
      var url = '${Urls.index}act=updateAddress&authid=$uid&address=${adr.address}&city=${adr.city}&state=${adr.state}&zip=${adr.zipCode}&country=${adr.country}';

      getMethod(url: url,callBack: (status,body,error){
        if(body != null){
          if(status == 200){
            Map<String,dynamic> data = jsonDecode(body);
            var msg = data['error'][0];
            if(data['status'] == 'success'){
              callBack(true,msg,null);
            }else{
              callBack(false,null,msg);
            }
          }else{
            callBack(false,null,'Something went wrong : $status');
          }
        }else{
          callBack(false,null,error);
        }
      });
    }else{
      callBack(false,null,'Fields are empty');
    }

  }



}