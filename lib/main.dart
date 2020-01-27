import 'package:flutter/material.dart';
import 'package:flutter_soft_ui/src/theme/lightColors.dart';
import 'package:flutter_soft_ui/src/theme/darkColors.dart';
import 'package:flutter_soft_ui/src/widget/customClipPainter.dart';
import 'package:flutter_soft_ui/src/widget/softContainer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: DarkColor.background,
        primaryColor: DarkColor.black,
        accentColor: DarkColor.lightblack,
        cardTheme: CardTheme(color: DarkColor.black),
        textTheme: TextTheme(
          display1: TextStyle(
            color: Color(0xffd1d1d0)
          )
        ),
        iconTheme: IconThemeData(
          color: DarkColor.lightGrey
        )
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Widget appbarWidget(){
    return Container(
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SoftContainer(
                      height: 50,
                      width: 50,
                      cornerRadius: 25,
                      child: Icon(Icons.format_list_bulleted, color:Theme.of(context).iconTheme.color),
                    ),
                    SoftContainer(
                     height: 50,
                     width: 50,
                     cornerRadius: 25,
                     child: Icon(Icons.card_giftcard, color:Theme.of(context).iconTheme.color),
                   )
                  ],
                ),
              );
  }
  Widget _filterIconsRow(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(Icons.filter),
          _icon(Icons.watch),
          _icon(Icons.web_asset),
          _icon(Icons.wb_auto),

        ],
      ),
    );
  }
  Widget _icon(IconData icon){
    return SoftContainer(
      height: 70,
      width: 70,
      cornerRadius: 15,
      child: Icon(icon, color:Theme.of(context).iconTheme.color),
    );
  }
  
  Widget _pentaContainer(){
    return  Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * .25,
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: ClipShadow(
        boxShadow:  <BoxShadow>[
            BoxShadow(color: Color(0xff000000), offset: Offset(2,2),blurRadius: 10),
            BoxShadow(color: Theme.of(context).accentColor, offset: Offset(-2, -2),blurRadius: 10),
            // BoxShadow(color: Color(0xffffffff),),
          ],
          clipper: ClipPainter(),
          child:  Container(
            height: MediaQuery.of(context).size.width * .65,
            width: MediaQuery.of(context).size.width * .6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(40)),
              color:  Theme.of(context).cardTheme.color,
              boxShadow: <BoxShadow>[
                BoxShadow(color: Color(0xff000000), offset: Offset(2,2),blurRadius: 10),
                BoxShadow(color: Theme.of(context).accentColor, offset: Offset(-2, -2),blurRadius: 10),
                // BoxShadow(color: Color(0xffffffff),),
              ],
            ),
        ),
      )
    );
 }
 Widget _bottomNavBar(){
  return SoftContainer(
    height: 60,
    width: MediaQuery.of(context).size.width - 40,
    cornerRadius: 15,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.home,size: 30,),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.settings,size: 30,),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.bookmark,size: 30,),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.person,size: 30,),
        )
      ],
    ),
  );
 }
 Widget _slideCountCircle(){
  return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(width: 20,),
        SoftContainer(height: 20,width: 20,cornerRadius: 10,),
        SoftContainer(height: 20,width: 20,cornerRadius: 10,),
        SoftContainer(height: 20,width: 20,cornerRadius: 10,),
        SizedBox(width: 20,),
      ],
    );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141414),
      body:Container(
       child: SingleChildScrollView(
         child: Stack(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width ,
                margin: EdgeInsets.only(top: 110),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                        child: Text(
                        'Featured',
                        style: GoogleFonts.montserrat(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                        child: Text(
                        'Collections',
                        style: GoogleFonts.londrinaOutline(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 40,
                          letterSpacing: 5,
                          color: DarkColor.lightGrey,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    _filterIconsRow(),
                    _pentaContainer(),
                    SizedBox(height: 20,),
                   _slideCountCircle(),
                  ]
                ),
              ),
            ),
             Positioned(
              top: MediaQuery.of(context).viewPadding.top + 20,
              left: 20,
              child: appbarWidget()
            ),
             Positioned(
              bottom:  0,
              left: 20,
              child: _bottomNavBar()
            ),
          ],
        ),
       )
      )
    );
  }
}
