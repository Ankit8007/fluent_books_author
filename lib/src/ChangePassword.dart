import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static const  String routeName = 'ChangePassword';
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: blue,
      body: SafeArea(

        child: Container(
          color: white,
          child: Column(
            children: [
              AppBarView(
                preIcon: Img.backIOSWhiteIcon,
                title: changePassword,
                preTap: (){
                  Navigator.pop(context);
                },
                backgroundColor: blue,

              ),
              Expanded(child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(s15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: [
                          EditCard(
                            inputType: TextInputType.name,
                            hint: 'Current Password',
                            txtCtrl: TextEditingController(text: ''),
                          ),
                          EditCard(
                            inputType: TextInputType.emailAddress,
                            hint: 'New Password',
                            txtCtrl: TextEditingController(text: ''),
                          ),
                          EditCard(
                            inputType: TextInputType.phone,
                            hint: 'Re-type New Password',
                            txtCtrl: TextEditingController(text: ''),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Button(label: 'update password',
                            labelStyle: txt_16_white,
                            boxDeco: boxDecoration(color: blue, radius: s10),
                          ),

                          Button(label: 'cancel',
                            labelStyle: txt_16_black,
                            boxDeco: boxDecoration(borderColor: black, radius: s10),
                          marginVertical: s15,

                          ),

                          TextView(forgotYourPassword_q, style: txt_14_black,),

                        ],
                      )









                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class EditCard extends StatelessWidget {
  const EditCard({Key? key, this.txtCtrl, this.hint, this.inputType}) : super(key: key);
 // final String label;
  final TextEditingController? txtCtrl;
  final String? hint;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return EditText(
      //label: label,
     // labelStyle: txt_12_blue_600,
      controller: txtCtrl,
      hint: hint,
      inputType: inputType,
      marginVertical: s10,
      boxDeco: boxDecoration(radius: s10,borderColor: grey),

    );
  }
}
