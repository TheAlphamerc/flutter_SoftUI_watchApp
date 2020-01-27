import 'package:flutter/material.dart';

class ClipPainter extends CustomClipper<Path>{
  @override
 
   Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0, size.height * .3);

    var height = size.height;
    var width = size.width;
  
    path.lineTo(0, size.height *.85 );


    /// [Bottom Left corner]
    var thirdControlPoint =  Offset(0  ,height );
    var thirdEndPoint = Offset(50  , height );
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);


    path.lineTo(size.width *.8 , size.height);

     /// [Bottom Right corner]
    var fourthControlPoint =  Offset(width   ,height );
    var fourthEndPoint = Offset(size.width   , height *.85 );
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy, fourthEndPoint.dx, fourthEndPoint.dy);

    path.lineTo(size.width , height * .15);
     
     /// [Top Right corner]
    var firstControlPoint =  Offset(size.width - width * .01  ,0);
    var firstEndPoint = Offset(size.width * .8 , height * .025);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx , firstEndPoint.dy);


    
    path.lineTo(size.width - width * .85, size.height * .15 );
    
     /// [Top Left corner]
    var secondControlPoint =  Offset(0  ,height * .18);
    var secondEndPoint = Offset(0  , height *.35);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

   

    path.lineTo(0, size.height );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

  
}
class ClipShadowPainter extends CustomPainter {
  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> clipShadow;

  ClipShadowPainter({
    @required this.clipper,
    @required this.clipShadow
  });

  @override
  void paint(Canvas canvas, Size size) {
    clipShadow.forEach((BoxShadow shadow) {
      var paint = shadow.toPaint();
      var spreadSize = Size(size.width + shadow.spreadRadius * 2, size.height + shadow.spreadRadius * 2);
      var clipPath = clipper.getClip(spreadSize).shift(Offset(
          shadow.offset.dx - shadow.spreadRadius,
          shadow.offset.dy - shadow.spreadRadius
      ));
      canvas.drawPath(clipPath, paint);
//      canvas.drawShadow(clipper.getClip(size), shadow.color, shadow.spreadRadius, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class ClipShadow extends StatelessWidget {
  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// The [Widget] below this widget in the tree.
  final Widget child;

  ClipShadow({
    @required this.boxShadow,
    @required this.clipper,
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClipShadowPainter(
          clipShadow: boxShadow,
          clipper: clipper
      ),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}