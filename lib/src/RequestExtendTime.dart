import 'package:fluent_books_author/CustomWidgets/EditText.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class RequestExtendTime extends StatefulWidget {
  const RequestExtendTime({Key? key}) : super(key: key);
  static const String routeName = 'RequestExtendTime';

  @override
  State<RequestExtendTime> createState() => _RequestExtendTimeState();
}

class _RequestExtendTimeState extends State<RequestExtendTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: SafeArea(
        child: Container(
          color: white,
          child: Column(
            children: [
              AppBarView(
                preIcon: Img.backIOSWhiteIcon,
                preTap: ()=> Navigator.pop(context),
                title: requestForExtendTime,
                backgroundColor: blue,
              ),
              Expanded(child: Container(

                child: Column(
                  children: [
                    EditText(
                      margin: s10,
                      boxDeco: boxDecoration(borderColor: grey, radius: s10),
                      fixedLines: 8,
                      inputType: TextInputType.multiline,
                      hint: 'Message',
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //
                    //   ),
                    //   maxLines: 5,
                    //   minLines: 5,
                    //   keyboardType: TextInputType.multiline,
                    //
                    // ),
                  ],
                ),
              )),
              Button(
                label: submit,
                labelStyle: txt_16_white,
                boxDeco: boxDecoration(color: blue, radius: s10),
                margin: s10,
              )
            ],
          ),
        ),
        )
    );
  }
}

