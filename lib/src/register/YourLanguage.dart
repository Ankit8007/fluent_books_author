import 'package:fluent_books_author/childWidgets/Indicator.dart';
import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/DropDown.dart';
import '../../CustomWidgets/EditText.dart';
import '../../CustomWidgets/ImageBtn.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../Models/DropMenuModel.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'PaymentInfo.dart';
import 'QualificationDoc.dart';

//"step":9
class YourLanguage extends StatefulWidget {
  const YourLanguage({Key? key}) : super(key: key);
  static const String routeName = 'YourLanguage';

  @override
  State<YourLanguage> createState() => _YourLanguageState();
}

class _YourLanguageState extends State<YourLanguage> {
  final AuthCtrl authX = Get.put(AuthCtrl());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadLang();
  }

  loadLang() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authX.getLangList((status, msg, error) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCtrl>(builder: (controller) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: greenishCyan,
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
                                      child: ImageView(
                                        Img.logoImg,
                                        size: s15 * 8,
                                      )),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextView(
                                        yourMotherTongue,
                                        style: txt_18_white_600_CM,
                                        marginTop: s40 * 2,
                                      )),
                                  DropDown(
                                      hint: 'Language',
                                      value: controller.regData.primaryLang,
                                      boxDeco: editTextDecoration(),
                                      marginTop: s20 * 2,
                                      list: authX.langLabel1,
                                      onChange: (newValue) => authX.setLang(
                                          type: 1, lang: newValue)),
                                  Padding(
                                    padding: EdgeInsets.only(top: s20 * 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextView(
                                          yourOtherLangs,
                                          style: txt_18_white_600_CM,
                                        ),
                                        // ImageBtn(
                                        //   childImg: Icon(Icons.add,color: white,size: s15 * 2,),
                                        //   padding: s5,
                                        //   boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true) ,
                                        // )
                                      ],
                                    ),
                                  ),
                                  DropDown(
                                    hint: 'Language',
                                    value: controller.regData.secondaryLang,
                                    boxDeco: editTextDecoration(),
                                    marginTop: s20 * 2,
                                    list: authX.langLabel2,
                                    onChange: (newValue) =>
                                        authX.setLang(type: 2, lang: newValue),
                                  ),
                                  DropDown(
                                    hint: 'Language',
                                    value: controller.regData.tertiaryLang,
                                    boxDeco: editTextDecoration(),
                                    marginTop: s20,
                                    list: authX.langLabel3,
                                    onChange: (newValue) =>
                                        authX.setLang(type: 3, lang: newValue),
                                  ),
                                  Button(
                                      label: next,
                                      labelStyle: txt_16_white,
                                      boxDeco: boxDecoration(
                                          color: blue,
                                          radius: s10,
                                          giveShadow: true),
                                      marginVertical: s40,
                                      isActive: authX.btnCtrl.lang,
                                      ontap: () {
                                        if (authX.btnCtrl.lang) {
                                          authX
                                              .updateLang((status, msg, error) {
                                            if (status) {
                                              Fluttertoast.showToast(msg: msg);
                                              Navigator.pushNamed(context,
                                                  QualificationDoc.routeName);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: error);
                                            }
                                          });
                                        }
                                      }),
                                ],
                              ),
                            ),
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
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Indicator(
                show: authX.btnCtrl.langLoader,
              ))
        ],
      );
    });
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}
