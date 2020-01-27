import 'package:flutter/material.dart';

class SoftSphare extends StatelessWidget {
  final Widget child;
  final double radius;
  const SoftSphare({Key key, this.child, this.radius = 150,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
       shape: BoxShape.circle,
        color: Color(0xfff1f3f6),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xff3754aa).withAlpha(25), offset: Offset(30, 30),blurRadius: 40),
          BoxShadow(color: Color(0xffffffff), offset: Offset(-30, -0),blurRadius: 40),
          BoxShadow(color: Color(0xffffffff),),
        ],
        gradient: RadialGradient(
          center: Alignment.topLeft, // near the top right
          radius: 1.5,
          colors:  [Color(0xffffff),Color(0xfff3f5f7),Color(0xffcfd6e8),Color(0xffffff)],
         stops: [.1,.3,.8,1.2],
        )
      ),
      child: child,
    );
  }
}