import 'package:flutter/material.dart';
import 'package:flutter_soft_ui/src/widget/softContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationbar extends StatefulWidget {
  BottomNavigationbar({Key key}) : super(key: key);

  @override
  _BottomNavigationbarState createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  Widget _homeIcon() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops:[.2,.4,.7,.9],
              colors: [
                Color(0xff1b58c0),
                Color(0xff2c53b2),
                Color(0xff5d438b),
                Color(0xff6e3c7d),
              ])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.home),
          Container(
            width: 3,
            margin: EdgeInsets.symmetric(horizontal:10),
            decoration: BoxDecoration(
              color:  Color(0xff34489b),
              boxShadow: <BoxShadow>[
               BoxShadow(
                   color:  Color(0xff36489a),
                   offset: Offset(-2, 0),
                   blurRadius: 6,
                   spreadRadius: 0),
               BoxShadow(
                   color:  Color(0xff4356ae),
                   offset: Offset(2, 0),
                   blurRadius: 3,
                   spreadRadius: 0),
             ]
           ),
          ),
          Text(
            'Home',
            style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SoftContainer(
      height: 65,
      width: MediaQuery.of(context).size.width - 40,
      cornerRadius: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _homeIcon(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
