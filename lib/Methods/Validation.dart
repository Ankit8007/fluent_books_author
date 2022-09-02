

import 'package:email_validator/email_validator.dart';

bool isEmail(String email){
 bool value =  EmailValidator.validate(email);
  return value;
}

bool isPassword(String password){
  var length= password.trim().length;
  if(length>5 && length <25){
    return true;
  }else{
    return false;
  }
}

bool isPhone(String phone){
  var length= phone.trim().length;
  if(length == 10){
    return false;
  }else{
    return false;
  }
}

bool isName(String name){
  var length = name.trim().length;
  if(length >= 4){
    return true;
  }else{
    return false;
  }
}

