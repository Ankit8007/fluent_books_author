import 'package:flutter/material.dart';

import '../../CustomWidgets/ImageBtn.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/fonts.dart';
import '../../component/size.dart';

class UnderReview extends StatefulWidget {
  const UnderReview({Key? key}) : super(key: key);
  static const String routeName = 'UnderReview';

  @override
  State<UnderReview> createState() => _UnderReviewState();
}

class _UnderReviewState extends State<UnderReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinkRose,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ImageBtn(
                  margin: s15,
                  childImg: Icon(Icons.arrow_back_ios, size: s20,color: white,),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                TextView(underReview,style: txt_18_white,),
              ],
            ),

            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.timelapse, color: blue, size: 150,),
                TextView(underReviewDesc,
                  style: txt_18_white_600_CM,
                  textAlign: TextAlign.center,
                  margin: s40
                )
              ],
            )),

            const BottomBanner(),
          ],
        ),
      ),
    );
  }
}
