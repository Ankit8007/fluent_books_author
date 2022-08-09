import 'package:flutter/material.dart';

import '../childWidgets/AppBarView.dart';
import '../childWidgets/NotificationCard.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/img.dart';
import '../component/size.dart';
import 'SideMenu.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static const  String routeName = 'Notifications';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
              title: notifications,
              preTap: (){
                _key.currentState!.openDrawer();
              },
            ),
            Expanded(
              child: Container(
                decoration: boxDecoration(color: white),
                child: ListView.separated(
                  padding: EdgeInsets.all(s15),
                  shrinkWrap: true,
                    itemBuilder: (context, index) => NotificationCard(),
                    separatorBuilder: (context, index) => SizedBox(height: s20,),
                    itemCount: 20),
              ),
            )
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
