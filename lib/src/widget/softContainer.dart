import 'package:flutter/material.dart';
import 'package:flutter_soft_ui/src/theme/theme.dart';

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
        border: Border.all(color:Theme.of(context).primaryColorDark.withAlpha(100)),
        color:  Theme.of(context).backgroundColor,
        boxShadow: AppTheme.getshadow(context)
      ),
      child: child,
    );
  }
}