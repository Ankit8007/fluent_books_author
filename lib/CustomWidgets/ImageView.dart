import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


const int svgImage = 4;
const int assetImage = 1;
const int networkImage = 2;
const int fileImage = 3;

class ImageView extends StatelessWidget {
  const ImageView(this.src,
      {Key? key, this.size, this.width, this.height, this.fit, this.type})
      : super(key: key);
  final String src;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? width,
      height: size ?? height,
      child: type == null || type == assetImage ?

      Image.asset(
        src,
        fit: fit,
      ) :type == networkImage ?
      Image.asset(
        src,
        fit: fit,
      ) : type == fileImage ?
      Image.asset(
        src,
        fit: fit,
      ): type == svgImage ?
      SvgPicture.asset(
          src,
          //color: Colors.red,
          fit: fit ?? BoxFit.contain,
          semanticsLabel: 'A red up arrow'
      ) : null,
    );
  }
}
