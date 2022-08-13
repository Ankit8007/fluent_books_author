import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/DropDown.dart';
import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);
  static const String routeName = 'Languages';

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
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
                title: 'Languages',
                preTap: (){
                  Navigator.pop(context);
                },
                backgroundColor: blue,
                preIcon: Img.backIOSWhiteIcon,
              ),
              Expanded(child: SingleChildScrollView(
                padding: EdgeInsets.all(s15),
                child: Column(
                  children: [
                    header('Choose Your Mother Tongue'),
                    DropDown(hint: english,
                      boxDeco: decoration(),
                      marginBottom: s20,
                    ),
                    header('Your Other Languages', child: ImageView(Img.addCirBlueIcon,
                    size: s20, onTap: (){},
                    )),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => DropDown(hint: english,
                          boxDeco: decoration(),
                        ),
                        separatorBuilder: (context, index) => SizedBox(height: s20,),
                        itemCount: 3)
                  ],
                ),
              )),
              Button(label: 'Save',
                labelStyle: txt_16_white,
                margin: s15,
                boxDeco: boxDecoration(
                    color: blue,
                  radius: s10,
                ),
              ),
              Button(label: 'Cancel',
                labelStyle: txt_16_black,
                marginHorizontal: s15,
                marginBottom: s15,
                boxDeco: boxDecoration(
                  radius: s10,
                  borderColor: black
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget header(title,{Widget? child}){
    return Padding(
      padding: EdgeInsets.only(top: s10, bottom: s20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(title,style: txt_14_black_600,),
          SizedBox(child: child,),
        ],
      ),
    );
  }

  BoxDecoration decoration(){
    return boxDecoration(borderColor: grey100, radius: s10);
  }
}
