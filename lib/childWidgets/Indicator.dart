import 'package:fluent_books_author/component/color.dart';
import 'package:flutter/material.dart';

import '../component/size.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.show}) : super(key: key);
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: s15 * 3,
            child: const CircularProgressIndicator(
              strokeWidth: 1.5,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}
