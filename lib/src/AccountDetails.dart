import 'package:flutter/material.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);
  static const  String routeName = 'AccountDetails';

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
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
                title: accountDetails,
                preTap: (){
                  Navigator.pop(context);
                },
                backgroundColor: blue,

              ),
              Expanded(child: Container(
                padding: EdgeInsets.all(s15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        EditCard(
                          label: 'Your Bank Name',
                          inputType: TextInputType.name,
                          hint: 'Bank Name',
                          txtCtrl: TextEditingController(text: ''),
                        ),
                        EditCard(
                          label: 'SWIFT Code',
                          inputType: TextInputType.emailAddress,
                          hint: 'Code',
                          txtCtrl: TextEditingController(text: ''),
                        ),
                        EditCard(
                          label: 'Bank Account Number',
                          inputType: TextInputType.phone,
                          hint: 'Bank Account Number',
                          txtCtrl: TextEditingController(text: ''),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Button(label: 'save',
                          labelStyle: txt_16_white,
                          boxDeco: boxDecoration(color: blue, radius: s10),
                        ),

                        Button(label: 'cancel',
                          labelStyle: txt_16_black,
                          boxDeco: boxDecoration(borderColor: black, radius: s10),
                          marginVertical: s15,

                        ),
                      ],
                    )









                  ],
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
  const EditCard({Key? key, this.txtCtrl, this.hint, this.inputType, required this.label}) : super(key: key);
  final String label;
  final TextEditingController? txtCtrl;
  final String? hint;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return EditText(
      label: label,
      labelStyle: txt_12_blue_600,
      controller: txtCtrl,
      hint: hint,
      inputType: inputType,
      marginVertical: s10,
      boxDeco: boxDecoration(radius: s10,borderColor: grey),

    );
  }
}
