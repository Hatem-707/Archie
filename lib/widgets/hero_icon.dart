import 'package:flutter/material.dart';

class HeroIcon extends StatelessWidget {
  const HeroIcon({super.key, required this.edge});
  final double edge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: edge,
      width: edge,
      child: Hero(
        tag: "icon",
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: BoxBorder.all(width: 2, style: BorderStyle.solid),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(edge),
            child: Image.asset("assets/images/icon.jpg", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
