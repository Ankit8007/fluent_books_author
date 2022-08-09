import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/ImageView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/img.dart';
import '../component/size.dart';
import '../controller/FragmentCtrl.dart';
import 'BookDetails.dart';
import 'SideMenu.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key}) : super(key: key);

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final FragmentCtrl scr = Get.put(FragmentCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: blue,
      body: SafeArea(
        child: Column(
          children: [
            AppBarView(
              preIcon: Img.menuIcon,
              title: bookShelf,
              postIcon: Img.notificationOutlineIcon,
              preTap: (){
                _key.currentState!.openDrawer();
              },
              postTap: (){
                scr.onMenuAction(5);
              },

            ),
            EditText(
              hint: search,
              marginHorizontal: s15,
              marginTop: s10,
              marginBottom: s20,
              boxDeco: boxDecoration(color: white, radius: s10),
              inputType: TextInputType.text,
              preChild: ImageView(
                Img.searchIcon,
                size: s15,
                marginRight: s10,
              ),
            ),
            Expanded(
                child: Container(
              decoration: boxDecoration(radiusTop: s20, color: white),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: s25, vertical: s25),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: s15 * 2,
                    mainAxisSpacing: s20,
                    childAspectRatio: 8 / 10),
                itemCount: 10,
                itemBuilder: (context, index) => ImageView(
                  Img.bookImg,
                  fit: BoxFit.cover,
                  radius: s15,
                  onTap: (){
                    Navigator.pushNamed(context,BookDetails.routeName);
                  },
                  boxDeco: boxDecoration(borderColor: blue, radius: s15),
                ),
              ),
            ))
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
