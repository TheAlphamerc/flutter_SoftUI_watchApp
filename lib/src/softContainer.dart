import 'package:flutter/material.dart';

class SoftContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double cornerRadius;
  const SoftContainer({Key key, this.child, this.width=150, this.height = 150, this.cornerRadius = 5}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        color: Color(0xfff1f3f6),
        border: Border.all(color: Colors.white),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xff3754aa).withAlpha(25), offset: Offset(30, 30),blurRadius: 40),
          BoxShadow(color: Color(0xffffffff), offset: Offset(-30, -0),blurRadius: 40),
          BoxShadow(color: Color(0xffffffff),),
        ],
      ),
      child: child,
    );
  }
}