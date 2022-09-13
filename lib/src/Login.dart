import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/ForgotPassword.dart';
import 'package:fluent_books_author/src/Fragment.dart';
import 'package:fluent_books_author/src/register/AddAddress.dart';
import 'package:fluent_books_author/src/register/AuthorBlurb.dart';
import 'package:fluent_books_author/src/register/ContactDetails.dart';
import 'package:fluent_books_author/src/register/CreateAccount.dart';
import 'package:fluent_books_author/src/register/CreatePassword.dart';
import 'package:fluent_books_author/src/register/PaymentInfo.dart';
import 'package:fluent_books_author/src/register/QualificationDoc.dart';
import 'package:fluent_books_author/src/register/SetupInterview.dart';
import 'package:fluent_books_author/src/register/UploadIcon.dart';
import 'package:fluent_books_author/src/register/VerifyOTP.dart';
import 'package:fluent_books_author/src/register/YourLanguage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/BottomBanner.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  loginListen(step) {
    String routName = '';
    switch (step) {
      case '1':
        routName = VerifyOTP.routeName;
        break;
      case '2':
        routName = CreateAccount.routeName;
        break;
      case '3':
        routName = CreatePassword.routeName;
        break;
      case '4':
        routName = AuthorBlurb.routeName;
        break;
      case '5':
        routName = UploadIcon.routeName;
        break;
      case '6':
        routName = AddAddress.routeName;
        break;
      case '7':
        routName = PaymentInfo.routeName;
        break;
      case '8':
        routName = YourLanguage.routeName;
        break;
      case '9':
        routName = QualificationDoc.routeName;
        break;
      case '10':
        routName = SetupInterview.routeName;
        break;
      case '11':
        routName = Fragment.routeName;
        break;
    }

    Navigator.pushNamed(context, routName);
  }

  @override
  Widget build(BuildContext context) {
    final AuthCtrl authX = Get.put(AuthCtrl());
    return Scaffold(
      backgroundColor: purpleMimosa,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(s15),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ImageView(
                            Img.logoImg,
                            size: s15 * 10,
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextView(
                            log_in,
                            style: txt_18_white_600_CM,
                            marginTop: s40,
                          )),
                      EditText(
                        hint: email,
                        boxDeco: editTextDecoration(),
                        marginVertical: s20,
                        controller: authX.emailLogin,
                        inputType: TextInputType.emailAddress,
                      ),
                      EditText(
                        hint: password,
                        boxDeco: editTextDecoration(),
                        controller: authX.passLogin,
                        inputType: TextInputType.visiblePassword,
                        secureText: true,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextView(
                            forgotYourPassword_q,
                            marginVertical: s40,
                            style: txt_13_white_600_undr,
                            onTap: () => Navigator.pushNamed(
                                context, ForgotPassword.routeName),
                          )),
                      GetBuilder<AuthCtrl>(
                        builder: (controller) => Button(
                          label: log_in,
                          labelStyle: txt_16_white,
                          isActive: authX.btnCtrl.login,
                          boxDeco: boxDecoration(
                              color: blue, radius: s10, giveShadow: true),
                          ontap: () {
                            if (authX.btnCtrl.login) {
                              authX.stepType = 'login';
                              authX.login((status, msg, error) {
                                if (status) {
                                  loginListen(msg['step']);
                                  Fluttertoast.showToast(msg: msg['msg']);
                                } else {
                                  Fluttertoast.showToast(msg: error);
                                }
                              });
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextView(
                            dontHaveAnAccount_q,
                            marginRight: s3,
                            marginTop: s40,
                            style: txt_13_white,
                          ),
                          TextView(
                            sign_up,
                            style: txt_13_blue_600_undr,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ContactDetails.routeName);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Expanded(child: BottomBanner()),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}
