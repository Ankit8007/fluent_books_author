
import 'package:fluent_books_author/src/EditProfil.dart';
import 'package:fluent_books_author/src/Fragment.dart';
import 'package:fluent_books_author/src/Login.dart';
import 'package:fluent_books_author/src/Splash.dart';
import 'package:fluent_books_author/src/register/AddAddress.dart';
import 'package:fluent_books_author/src/register/AddCardDetails.dart';
import 'package:fluent_books_author/src/register/AddChild.dart';
import 'package:fluent_books_author/src/register/AuthorBlurb.dart';
import 'package:fluent_books_author/src/register/ContactDetails.dart';
import 'package:fluent_books_author/src/register/CreateAccount.dart';
import 'package:fluent_books_author/src/register/CreatePassword.dart';
import 'package:fluent_books_author/src/register/PaymentInfo.dart';
import 'package:fluent_books_author/src/register/QualificationDoc.dart';
import 'package:fluent_books_author/src/register/SelectChildLikes.dart';
import 'package:fluent_books_author/src/register/SelectLanguages.dart';
import 'package:fluent_books_author/src/register/SetupInterview.dart';
import 'package:fluent_books_author/src/register/UnderReview.dart';
import 'package:fluent_books_author/src/register/UploadIcon.dart';
import 'package:fluent_books_author/src/register/VerifyOTP.dart';
import 'package:fluent_books_author/src/register/YourLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/AccountDetails.dart';
import 'src/BookDetails.dart';
import 'src/ChangePassword.dart';
import 'src/CreateBook.dart';
import 'src/ForgotPassword.dart';
import 'src/Languages.dart';
import 'src/Notifications.dart';
import 'src/PaymentDetails.dart';
import 'src/PrivacyPolicy.dart';
import 'src/RequestExtendTime.dart';
import 'src/TermsCondition.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName:(context) => const Splash(),
  Login.routeName: (context) => const Login(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  CreateAccount.routeName:(context)=> const CreateAccount(),
  UploadIcon.routeName: (context) => const UploadIcon(),
  ContactDetails.routeName:(context)=> const ContactDetails(),
  CreatePassword.routeName:(context)=> const CreatePassword(),
  AuthorBlurb.routeName: (context)=> const AuthorBlurb(),
  AddAddress.routeName:(context)=> const AddAddress(),
  PaymentInfo.routeName:(context)=> const PaymentInfo(),
  YourLanguage.routeName:(context)=> const YourLanguage(),
  QualificationDoc.routeName:(context)=> const QualificationDoc(),
  SetupInterview.routeName:(context)=> const SetupInterview(),
  VerifyOTP.routeName:(context)=> const VerifyOTP(),
  UnderReview.routeName:(context)=> const UnderReview(),
  AddCardDetails.routeName:(context)=> const AddCardDetails(),
  AddChild.routeName:(context)=> const AddChild(),
  SelectChildLikes.routeName:(context)=> const SelectChildLikes(),
  SelectLanguages.routeName:(context)=> const SelectLanguages(),
  Fragment.routeName:(context)=> const Fragment(),
  EditProfile.routeName:(context)=> const EditProfile(),

  AccountDetails.routeName:(context)=> const AccountDetails(),
  Notifications.routeName:(context)=> const Notifications(),
  ChangePassword.routeName:(context)=> const ChangePassword(),
  Languages.routeName:(context)=> const Languages(),
  PrivacyPolicy.routeName:(context)=> const PrivacyPolicy(),
  TermsCondition.routeName:(context)=> const TermsCondition(),
  BookDetails.routeName:(context)=> const BookDetails(),
  PaymentDetails.routeName:(context)=> const PaymentDetails(),
  EditProfile.routeName:(context)=> const EditProfile(),
  CreateBook.routeName:(context)=> const CreateBook(),
  RequestExtendTime.routeName:(context)=> const RequestExtendTime(),
};