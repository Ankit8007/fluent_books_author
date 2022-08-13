
import 'package:fluent_books_author/CustomWidgets/ImageView.dart';
import 'package:fluent_books_author/CustomWidgets/TextView.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';
import 'RequestExtendTime.dart';

class CreateBook extends StatefulWidget {
  const CreateBook({Key? key}) : super(key: key);
  static const String routeName = 'CreateBook';

  @override
  State<CreateBook> createState() => _CreateBookState();
}

class _CreateBookState extends State<CreateBook> {
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
                preIcon: Img.backIOSWhiteIcon,
                preTap: ()=> Navigator.pop(context),
                title: createBook,
                postIcon: Img.rotateIcon,
                postTap: (){},
                backgroundColor: blue,
              ),
              Expanded(child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 250,
                    margin: EdgeInsets.only(top: s20 * 2),
                    decoration: boxDecoration(borderColor: blue, radius: s10,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageView(Img.uploadIcon, size: s10 * 4, fit: BoxFit.contain,marginBottom: s15,),
                        TextView('Upload your book cover page\n Size : 210 X 297mm',
                        textAlign: TextAlign.center,
                        style: txt_10_black,)
                      ],
                    ),
                  ),

                  TextView('Free or Paid Type\n Category', style: txt_12_black_600,marginTop: s20 * 2,)
                ],
              )),
              Container(
                color: blue,
                child: Button(
                  label: startWork,
                  labelStyle: txt_16_blue_600,
                  boxDeco: boxDecoration(color: white, radius: s10,),
                  margin: s10,
                  ontap: ()=> Navigator.pushNamed(context, RequestExtendTime.routeName)
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
