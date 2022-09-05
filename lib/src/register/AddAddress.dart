import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/register/PaymentInfo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/EditText.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);
  static const String routeName = 'AddAddress';

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final AuthCtrl authX = Get.put(AuthCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowLightGold,
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
                              address,
                              style: txt_18_white_600_CM,
                              marginTop: s40,
                            )),

                        EditText(
                          hint: address,
                          boxDeco: editTextDecoration(),
                          marginVertical: s20,
                          onChange: (String value) =>
                              authX.regData.addressDetail.address = value,
                        ),

                        EditText(
                          hint: city,
                          boxDeco: editTextDecoration(),
                          onChange: (String value) =>
                              authX.regData.addressDetail.city = value,
                        ),

                        EditText(
                          hint: state,
                          boxDeco: editTextDecoration(),
                          marginVertical: s20,
                          onChange: (String value) =>
                              authX.regData.addressDetail.state = value,
                        ),

                        EditText(
                            hint: zipCode,
                            boxDeco: editTextDecoration(),
                            onChange: (String value) =>
                                authX.regData.addressDetail.zipCode = value),

                        EditText(
                            hint: country,
                            boxDeco: editTextDecoration(),
                            marginVertical: s20,
                            onChange: (String value) =>
                                authX.regData.addressDetail.country = value),

                        Button(
                          label: next,
                          labelStyle: txt_16_white,
                          boxDeco: boxDecoration(
                              color: blue, radius: s10, giveShadow: true),
                          marginVertical: s40,
                          ontap: () {
                            authX.updateAddress((status,msg,error){
                              if(status){
                                Fluttertoast.showToast(msg: msg);
                                Navigator.pushNamed(context, PaymentInfo.routeName);
                              }else{
                                Fluttertoast.showToast(msg: error);
                              }
                            });
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     TextView(dontHaveAnAccount_q,marginRight: s3, marginTop: s40,style: txt_15_white,),
                        //     TextView(sign_up,style: txt_15_blue_600_undr,)
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  //const Spacer(),

                  const BottomBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}
