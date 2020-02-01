import 'package:flutter/material.dart';
import 'softContainer.dart';
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
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.secondaryVariant,
                Theme.of(context).colorScheme.primaryVariant,
                Theme.of(context).colorScheme.primary,
              ])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.home,color:  Theme.of(context).colorScheme.onSecondary),
          Container(
            width: 3,
            margin: EdgeInsets.symmetric(horizontal:10),
            decoration: 
            BoxDecoration(
              color:  Theme.of(context).colorScheme.secondary,
              boxShadow: <BoxShadow>[
               BoxShadow(
                   color:  Theme.of(context).colorScheme.secondaryVariant,
                   offset: Offset(-2, 0),
                   blurRadius: 6,
                   spreadRadius: 0),
               BoxShadow(
                   color:  Theme.of(context).colorScheme.secondaryVariant,
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
              color:Theme.of(context).colorScheme.onSecondary
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
