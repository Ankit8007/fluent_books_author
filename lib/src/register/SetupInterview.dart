import 'package:flutter/material.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../childWidgets/DateRangeCalendar.dart';
import '../../childWidgets/TimerSheet.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'QualificationDoc.dart';
import 'VerifyOTP.dart';

class SetupInterview extends StatefulWidget {
  const SetupInterview({Key? key}) : super(key: key);
  static const String routeName = 'SetupInterview';

  @override
  State<SetupInterview> createState() => _SetupInterviewState();
}

class _SetupInterviewState extends State<SetupInterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleMimosa,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          size: s15 * 8,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              setupInterview,
                              style: txt_18_white_600_CM,
                              marginTop: s40 ,
                            ),
                            TextView(
                              setupIntervDesc,
                              style: txt_13_white,
                              marginVertical: s20,
                            ),
                          ],
                        )),

                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         TextView(
                    //           setupInterview,
                    //           style: txt_18_white_600_CM,
                    //           marginTop: s40,
                    //         ),
                    //         TextView(
                    //           setupIntervDesc,
                    //           style: txt_13_white,
                    //           marginVertical: s20,
                    //         ),
                    //       ],
                    //     )),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextView('Select Date',style: txt_14_white_600,
                          marginBottom: s20,
                        )),

                    Container(
                        padding: EdgeInsets.all(s15),
                        decoration: boxDecoration(
                          color: white,
                          radius: s10,
                        ),
                        child: DateRangeCalendar()),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextView('Select time',style: txt_14_white_600,
                          marginBottom: s5,
                          marginTop: s20,
                        )),
                    TimerSheet(),

                    Button(
                      label: next,
                      labelStyle: txt_16_white,
                      boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                      marginVertical: s40,
                      ontap: () {
                        Navigator.pushNamed(
                            context, VerifyOTP.routeName);
                      },
                    ),
                  ],
                ),
              ),
              //const Spacer(),

              const BottomBanner(),
            ],
          ),
        ),
      ),
    );
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10);
  }
}
