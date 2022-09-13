import 'package:fluent_books_author/childWidgets/Loader.dart';
import 'package:fluent_books_author/controller/AboutUsCtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/AppBarView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';
import 'SideMenu.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final AboutUsCtrl aboutX = Get.put(AboutUsCtrl());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutX.getData(pageId: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: blue,
      body: GetBuilder<AboutUsCtrl>(
        builder: (controller) => SafeArea(
          child: Stack(
            children: [
              Container(
                color: white,
                child: Column(
                  children: [
                    AppBarView(
                      preIcon: Img.menuIcon,
                      title: aboutUs,
                      backgroundColor: blue,
                      preTap: () {
                        _key.currentState!.openDrawer();
                      },
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding: EdgeInsets.all(s15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    aboutX.aboutUs,
                                    style: txt_12_black,
                                  ),
                                  const Spacer(),
                                  ImageView(
                                    Img.aboutBanner,
                                    width: double.infinity,
                                    height: s20 * 10,
                                    fit: BoxFit.fill,
                                    marginTop: 15,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Loader(
                show: aboutX.aboutUs.trim().isEmpty ? aboutX.loader : false,
              )
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
