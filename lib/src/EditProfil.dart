import 'package:flutter/material.dart';
import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../childWidgets/Avatar2.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';
import 'SideMenu.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  static const String routeName = 'EditProfile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<String> docList = [Img.doc1, Img.doc2];

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
                title: myProfile,
                backgroundColor: blue,
                preTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(s20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Avatar2(
                                img: Img.avatar,
                                size: s20 * 3,
                                name: 'Olivia Rodrigo',
                                style: txt_14_black_500,
                                paddingBottom: s15,
                                // padding: s20,
                              ),
                            ),
                          ],
                        ),
                        EditCard(
                          label: 'Name',
                          inputType: TextInputType.name,
                          hint: 'Name',
                          txtCtrl: TextEditingController(text: 'Olivia Rodrigo'),
                        ),
                        EditCard(
                          label: 'Email',
                          inputType: TextInputType.emailAddress,
                          hint: 'Email',
                          txtCtrl: TextEditingController(text: 'Olivia@email.com'),
                        ),
                        EditCard(
                          label: 'Phone Number',
                          inputType: TextInputType.phone,
                          hint: 'Phone Number',
                          txtCtrl: TextEditingController(text: 'Olivia Rodrigo'),
                        ),
                        EditCard(
                          label: 'Address',
                          inputType: TextInputType.streetAddress,
                          hint: 'Address',
                          txtCtrl: TextEditingController(text: 'Olivia Rodrigo'),
                        ),
                        EditCard(
                          label: 'Author blurb',
                          inputType: TextInputType.multiline,
                          hint: 'Name',
                          txtCtrl: TextEditingController(text: 'Olivia Rodrigo'),
                        ),
                        SizedBox(
                          height: s10,
                        ),
                        Button(
                          label: 'save',
                          labelStyle: txt_16_white,
                          boxDeco: boxDecoration(color: blue, radius: s10),
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
  const EditCard(
      {Key? key, required this.label, this.txtCtrl, this.hint, this.inputType})
      : super(key: key);
  final String label;
  final TextEditingController? txtCtrl;
  final String? hint;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return EditText(
      label: label,
      labelStyle: txt_12_black_600,
      controller: txtCtrl,
      hint: hint,
      inputType: inputType,
      marginVertical: s10,
      boxDeco: boxDecoration(radius: s10, borderColor: grey),
    );
  }
}
