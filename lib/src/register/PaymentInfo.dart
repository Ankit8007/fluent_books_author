import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/DropDown.dart';
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
import 'YourLanguage.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({Key? key}) : super(key: key);
  static const String routeName = 'PaymentInfo';

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenPaleOlive_light,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(s15),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: ImageView(Img.logoImg,size: s15 * 8,)),

                            Align(
                                alignment: Alignment.centerLeft,
                                child: TextView(paymentInfo,style: txt_18_white_600_CM,marginTop: s40 * 2, )),

                            // DropDown(hint: selectYourBank,
                            //   boxDeco: editTextDecoration(),
                            //   marginTop: s20 * 2,
                            // ),
                            EditText(
                              hint: emailAddress,
                              boxDeco: editTextDecoration(),
                              marginVertical: s20,
                              inputType: TextInputType.emailAddress,
                              onChange: (String value) => authX.regData.payEmail = value,
                            ),

                            EditText(
                              hint: phoneNumber,
                              boxDeco: editTextDecoration() ,
                              inputType: TextInputType.phone,
                              maxLength: 13,
                              onChange: (String value) => authX.regData.payPhoneNo = value,
                            ),



                            GetBuilder<AuthCtrl>(
                              builder: (controller) {
                                return Button(
                                  label: next,
                                  labelStyle: txt_16_white,
                                  boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                                  marginVertical: s40,
                                  isActive: authX.btnCtrl.payInfo,
                                  ontap: (){
                                    if(authX.btnCtrl.payInfo){
                                      authX.payInfo((status,msg,error){
                                        if(status){
                                          Fluttertoast.showToast(msg: msg);
                                          Navigator.pushNamed(context, YourLanguage.routeName);
                                        }else{
                                          Fluttertoast.showToast(msg: error);
                                        }
                                      });
                                    }

                                  },
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                      //const Spacer(),



                    ],
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
  editTextDecoration(){
    return boxDecoration(color: white, radius: s10,giveShadow: true);
  }
}
