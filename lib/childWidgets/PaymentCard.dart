import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key, this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: boxDecoration(borderColor: grey, radius: s8),
        padding: EdgeInsets.symmetric(vertical: s8, horizontal: s10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageView(Img.amountReceiveIcon, size: s5 * 7, fit: BoxFit.contain,
              marginRight: s10,
            ),

            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView('Received From', style: txt_12_black_500,),
                TextView('Admin', style: txt_10_grey,),
                TextView('12-12-1245, 4:56 PM', style: txt_10_grey,)
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView("@ 2,000",style: txt_green,),
                TextView('Credit To Bank', style: txt_10_grey_500,)
              ],
            )
          ],
        ),
      ),
    );
  }
}


