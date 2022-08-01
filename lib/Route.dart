import 'package:fluent_books_author/src/Login.dart';
import 'package:fluent_books_author/src/Splash.dart';
import 'package:fluent_books_author/src/register/AddAddress.dart';
import 'package:fluent_books_author/src/register/AddCardDetails.dart';
import 'package:fluent_books_author/src/register/AddChild.dart';
import 'package:fluent_books_author/src/register/AuthorBlurb.dart';
import 'package:fluent_books_author/src/register/ContactDetails.dart';
import 'package:fluent_books_author/src/register/CreateAccount.dart';
import 'package:fluent_books_author/src/register/CreatePassword.dart';
import 'package:fluent_books_author/src/register/SelectChildLikes.dart';
import 'package:fluent_books_author/src/register/SelectLanguages.dart';
import 'package:fluent_books_author/src/register/UploadIcon.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName:(context) => const Splash(),
  Login.routeName: (context) => const Login(),
  CreateAccount.routeName:(context)=> const CreateAccount(),
  UploadIcon.routeName: (context) => const UploadIcon(),
  ContactDetails.routeName:(context)=> const ContactDetails(),
  CreatePassword.routeName:(context)=> const CreatePassword(),
  AuthorBlurb.routeName: (context)=> const AuthorBlurb(),
  AddAddress.routeName:(context)=> const AddAddress(),
  AddCardDetails.routeName:(context)=> const AddCardDetails(),
  AddChild.routeName:(context)=> const AddChild(),
  SelectChildLikes.routeName:(context)=> const SelectChildLikes(),
  SelectLanguages.routeName:(context)=> const SelectLanguages(),
};