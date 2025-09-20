import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color color;

  const SvgIcon({
    Key? key,
    required this.assetPath,
    this.size = 24,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetPath, width: size, height: size, color: color);
  }
}
