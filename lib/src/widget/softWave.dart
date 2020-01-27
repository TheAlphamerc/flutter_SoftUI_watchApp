import 'dart:math';

import 'package:flutter/material.dart';

class SoftWave extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double cornerRadius;
  const SoftWave({Key key, this.child, this.width=150, this.height = 150, this.cornerRadius = 15}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Offset _offset = Offset(0, .5);
    return Transform(
      transform: Matrix4.identity()
      ..setEntry(3, 2, 0.001)
        ..rotateX(_offset.dy)
        ..rotateY(_offset.dx),
      child: Transform.rotate(
        angle:.8,
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            color: Color(0xfff1f3f6),
            border: Border.all(color: Colors.white),
            boxShadow: <BoxShadow>[
              BoxShadow(color: Color(0xffcad8ee), offset: Offset(30, 0),blurRadius: 20),
              BoxShadow(color: Color(0xffffffff), offset: Offset(0, 30),blurRadius: 20),
            ],
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xfff5f9ff),Color(0xffe8f0ff)]
            )
         ),
         child: child,
        ),
      ),
    );
  }
}