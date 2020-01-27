import 'package:flutter/material.dart';

class SoftContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double cornerRadius;
  final bool circularShape;
  const SoftContainer({Key key, this.child, this.width=150, this.height = 150, this.cornerRadius = 5, this.circularShape = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        color:  Theme.of(context).cardTheme.color,
        // border: Border.all(color: Color(0xff000000)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xff000000), offset: Offset(2,2),blurRadius: 10),
          BoxShadow(color: Theme.of(context).accentColor, offset: Offset(-2, -2),blurRadius: 10),
          // BoxShadow(color: Color(0xffffffff),),
        ],
      ),
      child: child,
    );
  }
}