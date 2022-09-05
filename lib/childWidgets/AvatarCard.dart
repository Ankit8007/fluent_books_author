import 'package:fluent_books_author/CustomWidgets/ImageView.dart';
import 'package:flutter/material.dart';

import '../component/size.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard(
      {Key? key,
      this.size,
      this.width,
      this.height,
      this.boxDeco,
      this.imageType,
      required this.src,
      this.margin,
      this.marginVertical,
      this.marginHorizontal,
      this.marginTop,
      this.marginLeft,
      this.marginRight,
      this.marginBottom,
      this.fit,
      this.onDelete})
      : super(key: key);
  final double? size;
  final double? width;
  final double? height;
  final BoxDecoration? boxDeco;
  final int? imageType;
  final String src;
  final double? margin;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginBottom;
  final GestureTapCallback? onDelete;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: margin ?? marginVertical ?? marginTop ?? s10,
              left: margin ?? marginHorizontal ?? marginLeft ?? s10,
              right: margin ?? marginHorizontal ?? marginRight ?? s10,
              bottom: margin ?? marginVertical ?? marginBottom ?? s10),
          decoration: boxDeco,
          width: size ?? width,
          height: size ?? height,
          child: ImageView(
            src,
            type: imageType,
            fit: fit,
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
                child: onDelete != null ? GestureDetector(
                  onTap: onDelete,
                    child: const Icon(Icons.close)) : null))
      ],
    );
  }
}
