import 'package:fluent_books_author/component/color.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key, this.show = false}) : super(key: key);
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(

          child: show ? const CircularProgressIndicator(
            color: blue,
            strokeWidth: 3,
          ) : null,
        ),
      ),
    );
  }
}
