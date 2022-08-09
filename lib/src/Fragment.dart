import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/FragmentCtrl.dart';

class Fragment extends StatefulWidget {
  const Fragment({Key? key}) : super(key: key);
  static const String routeName = 'Fragment';

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment> {
  final FragmentCtrl ctrlX = Get.put(FragmentCtrl());
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<FragmentCtrl>(builder: (controller) => ctrlX.currentScreen,);
  }
}
