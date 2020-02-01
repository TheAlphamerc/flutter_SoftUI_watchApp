import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/darkColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'theme/theme.dart';
import 'widget/bottomNavigationbar.dart';
import 'widget/customClipPainter.dart';
import 'widget/softContainer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkThemeEnabled = false;
  Widget appbarWidget() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Hero(
              tag: 'topLeftIcon',
              child: SoftContainer(
                height: 50,
                width: 50,
                cornerRadius: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Divider(
                      height: 10,
                      indent: 12,
                      endIndent: 18,
                      color: Theme.of(context).iconTheme.color,
                      thickness: 2,
                    ),
                    Divider(
                      height: 8,
                      indent: 12,
                      endIndent: 10,
                      color: Theme.of(context).iconTheme.color,
                      thickness: 2,
                    ),
                    Divider(
                      height: 10,
                      indent: 12,
                      endIndent: 18,
                      color: Theme.of(context).iconTheme.color,
                      thickness: 2,
                    ),
                  ],
                ),
              )),
          Hero(
              tag: 'cartIcon',
              child: GestureDetector(
                  onTap: () {
                    darkThemeEnabled = !darkThemeEnabled;
                    bloc.changeTheme(darkThemeEnabled);
                  },
                  child: SoftContainer(
                    height: 50,
                    width: 50,
                    cornerRadius: 25,
                    child: Icon(FontAwesomeIcons.lightbulb,
                        color: Theme.of(context).iconTheme.color),
                  )))
        ],
      ),
    );
  }

  Widget _filterIconsRow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(FontAwesomeIcons.slidersH),
          _watchIcon(),
          _icon(FontAwesomeIcons.yinYang),
          _icon(Icons.wb_auto),
        ],
      ),
    );
  }

  Widget _icon(IconData icon) {
    return SoftContainer(
      height: 70,
      width: 70,
      cornerRadius: 15,
      child: Icon(icon, color: Theme.of(context).iconTheme.color),
    );
  }

  Widget _watchIcon() {
    return Container(
      height: 70,
      width: 70,
      decoration: AppTheme.getDecoration(context, borderRadius: 10),
      child:
          Icon(Icons.watch, color: Theme.of(context).colorScheme.onSecondary),
    );
  }

  Widget _pentaContainer() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .3,
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/detail');
            },
            child: Hero(
                tag: 'pentaContainer',
                child: ClipShadow(
                  boxShadow: AppTheme.getshadow(context),
                  clipper: ClipPainter(),
                  child: Container(
                    height: MediaQuery.of(context).size.width * .65,
                    width: MediaQuery.of(context).size.width * .6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(40)),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 40, top: 50),
                          child: Text(
                            'Cyberwatch',
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            'Lab 01',
                            style: GoogleFonts.londrinaOutline(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 28,
                              letterSpacing: 2,
                              color: DarkColor.lightGrey,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 40, top: 20, bottom: 20),
                          child: Text(
                            'release: 23.06.2020',
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 15,
                              color: DarkColor.subTitleTextColor,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
        Positioned(
          left: 0,
          top: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sideRotatedText('Cybertime', true),
              SizedBox(
                height: 50,
              ),
              _sideRotatedText('Series 000', false)
            ],
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: 'watch',
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Image.asset(
                    'assets/watch.png',
                    height: MediaQuery.of(context).size.height * .28,
                  ),
                )))
      ],
    );
  }

  Widget _sideRotatedText(String text, bool enable) {
    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        children: <Widget>[
          Container(
            height: 3,
            width: enable ? 70 : 0,
            decoration: AppTheme.getDecoration(context, borderRadius: 10),
          ),
          SizedBox(height: 15),
          Text(
            text,
            style: TextStyle(
              color: enable
                  ? Theme.of(context).textTheme.display1.color
                  : DarkColor.subTitleTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          
        ],
      ),
    );
  }

  Widget _slideCountCircle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
        ),
        SoftContainer(
          height: 12,
          width: 12,
          cornerRadius: 10,
        ),
        SoftContainer(
          height: 12,
          width: 12,
          cornerRadius: 10,
        ),
        SoftContainer(
          height: 12,
          width: 12,
          cornerRadius: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).backgroundColor,
        statusBarColor: Theme.of(context).backgroundColor));
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 150,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 110),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Text(
                                'Featured',
                                style: GoogleFonts.montserrat(
                                  textStyle:
                                      Theme.of(context).textTheme.display1,
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
                                  textStyle:
                                      Theme.of(context).textTheme.display1,
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
                            SizedBox(
                              height: 20,
                            ),
                            _slideCountCircle(),
                          ]),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).viewPadding.top + 20,
                      left: 20,
                      child: appbarWidget()),
                  Positioned(bottom: 0, left: 20, child: BottomNavigationbar()),
                ],
              ),
            )));
  }
}
