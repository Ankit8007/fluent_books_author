
import 'package:flutter/material.dart';

import '../CustomWidgets/TextView.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class TimerSheet extends StatelessWidget {
  const TimerSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: s15, vertical: s5),
      decoration: boxDecoration(
        color: white,
        radius: s10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          selector('08', 'h'),
          TextView(':',style: txt_16_black_600,),
          selector('30', 'm'),
          const TextView(' '),
          Column(
            children: [
              TextView('AM', onTap: (){},  style: txt_14_black_600, marginBottom: s10,),
              TextView('PM', onTap: (){},  style: txt_14_black_600,),
            ],
          )
        ],
      ),
    );
  }

  Widget selector(String data1, String data2){
    return Column(
      children: [
        Icon(Icons.arrow_drop_up, color: blue,),
        TextView(data1 +' '+data2, style: txt_16_black_600,),
        Icon(Icons.arrow_drop_down, color: blue,),
      ],
    );
  }
}


