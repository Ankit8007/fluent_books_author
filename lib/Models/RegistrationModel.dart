import 'package:fluent_books_author/Models/DropMenuModel.dart';

import 'MapModel.dart';

class RegistrationModel {
  String email;
  String phoneNo;
  String firstName;
  String lastName;
  String password;
  String rePassword;
  String about;
  String photo;
  AddressDetails addressDetail;
  String payEmail;
  String payPhoneNo;
  List<String> docList;
  String meetDate;
  String meetTime;
  int? selectedSlot;
  String otp;
  DropMenuModel? primaryLang;
  DropMenuModel? secondaryLang;
  DropMenuModel? tertiaryLang;

  RegistrationModel({
    this.email = '',
    this.phoneNo = '',
    this.password = '',
    this.rePassword = '',
    this.firstName = '',
    this.lastName = '',
    this.about = '',
    this.photo = '',
    required this.addressDetail,
    this.payEmail = '',
    this.payPhoneNo = '',
    required this.docList,
    this.meetDate = '',
    this.meetTime = '',
    this.otp = '',
    this.primaryLang,
    this.secondaryLang,
    this.tertiaryLang,
    this.selectedSlot
  });
}

class AddressDetails {
  String address;
  String city;
  String state;
  String zipCode;
  String country;

  AddressDetails({this.address = '',
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.country = ''});
}
