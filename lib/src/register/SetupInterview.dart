import 'package:fluent_books_author/Methods/DateFormat.dart';
import 'package:fluent_books_author/Models/InterviewTimeModel.dart';
import 'package:fluent_books_author/Models/SlotModel.dart';
import 'package:fluent_books_author/childWidgets/ChipCard.dart';
import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/Fragment.dart';
import 'package:fluent_books_author/src/register/UnderReview.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../childWidgets/DateRangeCalendar.dart';
import '../../childWidgets/Indicator.dart';
import '../../childWidgets/TimerSheet.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'QualificationDoc.dart';
import 'VerifyOTP.dart';

//step":11
class SetupInterview extends StatefulWidget {
  const SetupInterview({Key? key}) : super(key: key);
  static const String routeName = 'SetupInterview';

  @override
  State<SetupInterview> createState() => _SetupInterviewState();
}

class _SetupInterviewState extends State<SetupInterview> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTime();
  }

  loadTime(){
    authX.timeSlot((status,msg,data){});
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCtrl>(
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: purpleMimosa,
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
                                      size: s15 * 8,
                                    )),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          setupInterview,
                                          style: txt_18_white_600_CM,
                                          marginTop: s40 ,
                                        ),
                                        TextView(
                                          setupIntervDesc,
                                          style: txt_13_white,
                                          marginVertical: s20,
                                        ),
                                      ],
                                    )),

                                // Align(
                                //     alignment: Alignment.centerLeft,
                                //     child: Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         TextView(
                                //           setupInterview,
                                //           style: txt_18_white_600_CM,
                                //           marginTop: s40,
                                //         ),
                                //         TextView(
                                //           setupIntervDesc,
                                //           style: txt_13_white,
                                //           marginVertical: s20,
                                //         ),
                                //       ],
                                //     )),

                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextView('Select Date',style: txt_14_white_600,
                                      marginBottom: s20,
                                    )),

                                Container(
                                    padding: EdgeInsets.all(s15),
                                    decoration: boxDecoration(
                                      color: white,
                                      radius: s10,
                                    ),
                                    child: DateRangeCalendar(
                                      onChangeSelection: (DateRangePickerSelectionChangedArgs args){
                                        DateTime dt = args.value;
                                        String date = convertDate(dateTime: dt, toPattern:  dateFormat_YYYY_MM_DD);
                                        print(date);
                                        authX.regData.meetDate = date;

                                    },
                                    )),

                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextView('Select time',style: txt_14_white_600,
                                      marginBottom: s5,
                                      marginTop: s20,
                                    )),
                               Container(
                                 decoration: boxDecoration(radius: s10, color: white),
                                 height: s10 * 7,
                                 child:  GridView.builder(
                                   padding: EdgeInsets.symmetric(horizontal: s15,vertical: s15),
                                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                       crossAxisCount: 3,
                                        crossAxisSpacing: s10,
                                       mainAxisSpacing: s8,
                                     mainAxisExtent: s15 * 2

                                   ),
                                   itemCount: authX.mainSlotList.length,
                                   itemBuilder: (context, index) {
                                     bool status = authX.regData.selectedSlot != null && authX.regData.selectedSlot! == index ? true : false;
                                     return ChipCard(
                                       paddingVertical: s5,
                                        bgColor: status ? blue : null,
                                       // borderColor: data.status ? Colors.transparent : data.type == disabled ? greyHint : black,
                                       borderColor: status ? Colors.transparent : black,
                                       child: TextView(
                                         authX.mainSlotList[index].slot,
                                           textAlign: TextAlign.center,
                                         // style: status ? txt_14_white : data.type == disabled ? txt_14_hint : txt_14_black,
                                         style: status ? txt_14_white : txt_14_black,
                                       ),
                                       onTap: ()=> {
                                         authX.regData.selectedSlot = index,
                                         authX.regData.meetTime =  authX.mainSlotList[index].slot,
                                         authX.update()
                                       },
                                     );
                                   } ,
                                 ),
                               ),

                                Button(
                                  label: next,
                                  labelStyle: txt_16_white,
                                  boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                                  marginVertical: s40,
                                   isActive: authX.btnCtrl.interview,
                                  ontap: () {

                                    if(authX.btnCtrl.interview){
                                      authX.interviewRequest((status,msg,error){
                                        if(status){
                                          Fluttertoast.showToast(msg: msg);
                                          String routeName = '';
                                          if(authX.stepType == 'login'){
                                            routeName = Fragment.routeName;
                                          }else{
                                            routeName = UnderReview.routeName;
                                          }
                                          Navigator.pushNamed(
                                              context, routeName);
                                        }else{
                                          Fluttertoast.showToast(msg: error);
                                        }
                                      });
                                    }

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
      }
    );
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10);
  }
}
