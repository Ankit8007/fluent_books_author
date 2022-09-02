import 'package:fluent_books_author/childWidgets/AvatarCard.dart';
import 'package:fluent_books_author/childWidgets/BottomBanner.dart';
import 'package:fluent_books_author/src/register/AddAddress.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/EditText.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'ContactDetails.dart';

class UploadIcon extends StatefulWidget {
  const UploadIcon({Key? key}) : super(key: key);
  static const routeName = 'UploadIcon';

  @override
  State<UploadIcon> createState() => _UploadIconState();
}

class _UploadIconState extends State<UploadIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink_magentaRed,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(s15),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ImageView(
                              Img.logoImg,
                              size: s15 * 10,
                            )),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextView(
                              uploadPhoto,
                              style: txt_18_white_600_CM,
                              marginTop: s40,
                            )),

                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: EditText(
                                hint: '$uploadPhoto',
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
                                  labelStyle: txt_14_white,
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
                                itemBuilder: (context, index) =>  AvatarCard(src: Img.logoImg, size: s20 * 3,
                                  boxDeco: boxDecoration(color: grey, radius: s5),
                                  onDelete: (){

                                  },
                                ),
                                separatorBuilder: (context, index) => SizedBox(width: s5,),
                                itemCount: 2),
                          ),
                        ),



                        Button(
                          label: next,
                          labelStyle: txt_16_white,
                          boxDeco: boxDecoration(color: blue, radius: s10,giveShadow: true),
                          marginVertical: s40,
                          ontap: () {
                            Navigator.pushNamed(context, AddAddress.routeName);
                          },
                        ),
                      ],
                    ),
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
}
