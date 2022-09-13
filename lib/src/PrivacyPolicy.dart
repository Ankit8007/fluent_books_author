import 'package:fluent_books_author/childWidgets/Loader.dart';
import 'package:fluent_books_author/controller/AboutUsCtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);
  static const String routeName = 'PrivacyPolicy';
  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final AboutUsCtrl aboutX = Get.put(AboutUsCtrl());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutX.getData(pageId: 2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: blue,
      body: SafeArea(
        child: GetBuilder<AboutUsCtrl>(
        builder: (controller) => Stack(
            children: [
              Container(
                color: white,
                child: Column(
                  children: [
                    AppBarView(
                      preIcon: Img.backIOSWhiteIcon,
                      title: privacyPolicy,
                      backgroundColor: blue,
                      preTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(s15),
                        child: TextView(aboutX.privacyPolicy,style: txt_12_black,),
                      ),
                    )
                  ],
                ),
              ),

               Loader(show: aboutX.privacyPolicy.trim().isEmpty ? aboutX.loader : false,)
            ],
          ),
        ),
      ),
    );
  }
}
