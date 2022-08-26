import 'package:fluent_books_author/src/register/SetupInterview.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/EditText.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/AvatarCard.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'ContactDetails.dart';

class QualificationDoc extends StatefulWidget {
  const QualificationDoc({Key? key}) : super(key: key);
  static const String routeName = 'QualificationDoc';

  @override
  State<QualificationDoc> createState() => _QualificationDocState();
}

class _QualificationDocState extends State<QualificationDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueLightNorthern,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
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
                          child: TextView(
                            yourQualificationDoc,
                            style: txt_18_white_600_CM,
                            marginTop: s40 * 2,
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextView(
                            qualificationDocDesc,
                            style: txt_14_white,
                            marginTop: s20,
                          )),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: EditText(
                              hint: uploadDocHere.toLowerCase(),
                              hintStyle: txt_14_white,
                              boxDeco:
                              boxDecoration(radius: s10, borderColor: white),
                              marginVertical: s20,
                              marginRight: s10,
                              readOnly: true,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Button(
                                label: upload,
                                labelStyle: txt_13_white,
                                boxDeco: boxDecoration(color: blue, radius: s8)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: s20 * 4,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => AvatarCard(
                                src: Img.logoImg,
                                size: s20 * 3,
                                boxDeco: boxDecoration(color: grey, radius: s5),
                                onDelete: () {},
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                width: s5,
                              ),
                              itemCount: 2),
                        ),
                      ),
                      Button(
                        label: next,
                        labelStyle: txt_16_white,
                        boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                        marginVertical: s40,
                        ontap: () {
                          Navigator.pushNamed(context, SetupInterview.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //const Spacer(),
            const BottomBanner(),
          ],
        ),
      ),
    );
  }
}
