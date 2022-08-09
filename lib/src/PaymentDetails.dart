import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);
  static const String routeName = 'PaymentDetails';

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
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
                title: 'Payment Details',
                preIcon: Img.backIOSWhiteIcon,
                preTap: () => Navigator.pop(context),
                backgroundColor: blue,
              ),
              Expanded(child: SingleChildScrollView(
                padding: EdgeInsets.all(s15),
                child: Column(
                  children: [
                    Card(label: 'Transaction Date',text: '07-20-2022, 5:30 PM'),
                    Card(label: 'Transaction Id',text: '5895251212'),
                    Card(label: 'Reference Id',text: '4152637485'),
                    Card(label: 'Received From',
                      child: Padding(
                        padding: EdgeInsets.only(top: s5),
                        child: Row(
                          children: [
                            ImageView(Img.amountReceiveIcon, size: s5 * 6, fit: BoxFit.contain,
                              marginRight: s10,
                            ),
                            TextView('Admin',style: txt_12_black,),
                            const Spacer(),
                            TextView("@ 2,000",style: txt_12_green,),
                          ],
                        ),
                      ),),
                    Card(label: 'Credit To',
                    child: Padding(
                      padding: EdgeInsets.only(top: s5),
                      child: Row(
                        children: [
                          ImageView(Img.bankBlueIcon, size: s5 * 6,marginRight: s5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView('********451', style: txt_12_black,),
                              TextView('ICICI Bank Canada',style: txt_12_black,)
                            ],
                          )
                        ],
                      ),
                    ),),
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

class Card extends StatelessWidget {
  const Card({Key? key, required this.label, this.text, this.child}) : super(key: key);
  final String label;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: s5),
      padding: EdgeInsets.all(s15),
      decoration: boxDecoration(borderColor: grey100, radius: s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(label, style: txt_11_blue_600,),
          SizedBox(child: text != null ?
            TextView(text ?? '', style: txt_12_black_600,marginTop: s5,) : null,),
          SizedBox(child: child,)
        ],
      ),
    );
  }
}

