import 'package:flutter/material.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/DropDown.dart';
import '../../CustomWidgets/EditText.dart';
import '../../CustomWidgets/ImageBtn.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'PaymentInfo.dart';
import 'QualificationDoc.dart';

class YourLanguage extends StatefulWidget {
  const YourLanguage({Key? key}) : super(key: key);
  static const String routeName = 'YourLanguage';

  @override
  State<YourLanguage> createState() => _YourLanguageState();
}

class _YourLanguageState extends State<YourLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenishCyan,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(s15),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: ImageView(Img.logoImg,size: s15 * 8,)),

                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextView(yourMotherTongue,style: txt_18_white_600_CM,marginTop: s40 *2,)),

                            DropDown(hint: 'Language',
                              boxDeco: editTextDecoration(),
                              marginTop: s20 * 2,
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: s20 * 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextView(yourOtherLangs,style: txt_18_white_600_CM,),
                                  // ImageBtn(
                                  //   childImg: Icon(Icons.add,color: white,size: s15 * 2,),
                                  //   padding: s5,
                                  //   boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true) ,
                                  // )
                                ],
                              ),
                            ),


                            DropDown(hint: 'Language',
                              boxDeco: editTextDecoration(),
                              marginTop: s20 * 2,
                            ),

                            DropDown(hint: 'Language',
                              boxDeco: editTextDecoration(),
                              marginTop: s20,
                            ),



                            Button(
                              label: next,
                              labelStyle: txt_16_white,
                              boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                              marginVertical: s40,
                              ontap: (){
                                Navigator.pushNamed(context, QualificationDoc.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                      //const Spacer(),


                    ],
                  ),
                  const Spacer(),
                  const BottomBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  editTextDecoration(){
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}
