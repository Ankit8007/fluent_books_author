import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';
import 'SideMenu.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({Key? key}) : super(key: key);

  @override
  State<NewsLetter> createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
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
                backgroundColor: blue,
                preIcon: Img.menuIcon,
                title: emailNewsLetter,
                preTap: (){
                  _key.currentState!.openDrawer();
                },
              ),

              Expanded(child: Container(
                padding: EdgeInsets.all(s15),
                child: Column(
                  children: [
                    ImageView(
                        Img.newsLetterBanner,
                    width: MediaQuery.of(context).size.width /1.5,
                      fit: BoxFit.fill,

                      marginVertical: s20* 2,
                    ),
                    TextView('Subscribe to our newsletter',style: txt_18_blue_600_CM,),
                    TextView(
                        'Be the first to get exclusive offers and promotional invites directly in your inbox',
                      textAlign: TextAlign.center,
                      style: txt_10_black,
                      marginVertical: s10,

                    ),

                    EditText(
                      hint: 'Email Address',
                      boxDeco: boxDecoration(borderColor: grey100, radius: s10),
                      inputType: TextInputType.emailAddress,
                      marginVertical: s10,
                    ),
                    const Spacer(),

                    Button(label: 'subscribe',
                      labelStyle: txt_16_white,
                      boxDeco: boxDecoration(color: blue, radius: s10),
                    )
                  ],
                ),
              ))

            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
