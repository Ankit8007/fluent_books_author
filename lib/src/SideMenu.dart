
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../childWidgets/SideMenuCard.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/img.dart';
import '../component/size.dart';
import '../controller/FragmentCtrl.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final FragmentCtrl ctrlX = Get.put(FragmentCtrl());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: blue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: s20 * 2),
                  shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => SideMenuCard(
                        icon: sideMenuList[index].image,
                        title: sideMenuList[index].title,
                      onTap: (){
                          Navigator.pop(context);
                          ctrlX.onMenuAction(index);
                      },
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: s20 * 2,
                        ),
                    itemCount: sideMenuList.length),

                SizedBox(height: s20,),

               SideMenuCard(icon: Img.logoutIcon, title: logout,onTap: (){},)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
