
import 'package:fluent_books_author/src/Fragment.dart';
import 'package:fluent_books_author/src/register/CreateAccount.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluePaleLavender,
      body: SafeArea(
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
                        style: txt_20_white_600_CM,
                        marginTop: s40,
                      )),
                  EditText(
                    hint: email,
                    boxDeco: editTextDecoration(),
                    marginVertical: s20,
                  ),
                  EditText(
                    hint: password,
                    boxDeco: editTextDecoration(),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextView(
                        forgotYourPassword_q,
                        marginVertical: s40,
                        style: txt_15_white_600_undr,
                      )),
                  Button(
                    label: log_in,
                    labelStyle: txt_20_white,
                    boxDeco: boxDecoration(color: blue, radius: s10),
                    ontap: () => Navigator.pushNamed(context, Fragment.routeName),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextView(
                        dontHaveAnAccount_q,
                        marginRight: s3,
                        marginTop: s40,
                        style: txt_15_white,
                      ),
                      TextView(
                        sign_up,
                        style: txt_15_blue_600_undr,
                        onTap: () {
                          Navigator.pushNamed(context, CreateAccount.routeName);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),

            const BottomBanner(),
          ],
        ),
      ),
    );
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10);
  }
}
