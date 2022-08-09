import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/ImageView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';
import 'SideMenu.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: blue,
      body: SafeArea(
        child: Container(
          color: white,
          child: Column(
            children: [
              AppBarView(
                preIcon: Img.menuIcon,
                title: contactUs,
                backgroundColor: blue,
                preTap: (){
                  _key.currentState!.openDrawer();
                },
              ),
              Expanded(child: SingleChildScrollView(
                padding: EdgeInsets.all(s15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditText(
                      hint: 'Full Name',
                      boxDeco: decoration(),
                      marginVertical: s8,
                    ),
                    EditText(
                      hint: 'Email',
                      boxDeco: decoration(),
                      inputType: TextInputType.emailAddress,
                      marginVertical: s8,
                    ),
                    EditText(
                      hint: 'Message',
                      inputType: TextInputType.multiline,
                      maxLines: 5,
                      boxDeco: decoration(),
                      marginVertical: s8,
                    ),

                    SizedBox(height: s20 *4,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: s20),
                        scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ImageView(socialIconList[index]),
                          separatorBuilder: (context, index) => SizedBox(width: s10,) ,
                          itemCount: socialIconList.length
                      ),
                    )

                  ],
                ),
              )),
              Button(
                label: 'Submit',
                labelStyle: txt_16_white,
                boxDeco: boxDecoration(color: blue, radius: s10),
                margin: s15,
              )
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }

  BoxDecoration decoration(){
    return boxDecoration(borderColor: grey100, radius: s10);
  }
}

