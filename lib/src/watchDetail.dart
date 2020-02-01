import 'package:flutter/material.dart';
import 'theme/darkColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/theme.dart';
import 'widget/customClipPainter.dart';
import 'widget/softContainer.dart';

class WatchDetailPage extends StatefulWidget {
  WatchDetailPage({Key key}) : super(key: key);

  @override
  _WatchDetailPageState createState() => _WatchDetailPageState();
}

class _WatchDetailPageState extends State<WatchDetailPage> {
  Widget appbarWidget() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Hero(
                  tag: 'topLeftIcon',
                  child: SoftContainer(
                    height: 50,
                    width: 50,
                    cornerRadius: 25,
                    child: Icon(Icons.arrow_back,
                        color: Theme.of(context).iconTheme.color),
                  ))),
          Hero(
              tag: 'cartIcon',
              child: SoftContainer(
                height: 50,
                width: 50,
                cornerRadius: 25,
                child: Icon(FontAwesomeIcons.shareAlt,
                    color: Theme.of(context).iconTheme.color),
              ))
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
          _icon(FontAwesomeIcons.compass),
          _watchIcon(),
          _icon(Icons.bookmark_border),
          _icon(FontAwesomeIcons.cubes),
        ],
      ),
    );
  }

  Widget _icon(IconData icon) {
    return SoftContainer(
      height: 50,
      width: 50,
      cornerRadius: 15,
      child: Icon(icon, color: Theme.of(context).iconTheme.color),
    );
  }

  Widget _watchIcon() {
    return Container(
      height: 50,
      width: 50,
      decoration: _decoration(context, borderRadius: 10),
      child:
          Icon(Icons.watch, color: Theme.of(context).colorScheme.onSecondary),
    );
  }

  Widget _pentaContainer() {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .7,
          // margin: EdgeInsets.only(top: 10),
          alignment: Alignment.bottomCenter,
          child: Hero(
              tag: 'pentaContainer',
              child: ClipShadow(
                boxShadow: AppTheme.getshadow(context),
                clipper: ClipPainter(),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width * .85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(40)),
                      color: Theme.of(context).backgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _filterIconsRow(),
                      Padding(
                        padding: EdgeInsets.only(left: 40, top: 10),
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
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 10, bottom: 40),
                        child: Text(
                          'Cybertime is formed with a polygonal steainless steel body of an edgy and futuristic look. Echoing and cyberpunk vibes of blade runner..',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 18,
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
        Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: 'watch',
              child: Image.asset(
                'assets/watch.png',
                height: MediaQuery.of(context).size.height * .35,
              ),
            ))
      ],
    );
  }

  Widget _bottomBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SoftContainer(
        height: 50,
        width: MediaQuery.of(context).size.width * .85,
        cornerRadius: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '\$4,200',
                style:
                    Theme.of(context).textTheme.display1.copyWith(fontSize: 18),
              ),
            ),
            _preOrderButton(),
          ],
        ),
      ),
    );
  }

  Widget _preOrderButton() {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                .2,
                .4,
                .5,
                .8
              ],
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.secondaryVariant,
                Theme.of(context).colorScheme.primaryVariant,
                Theme.of(context).colorScheme.primary,
              ])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Preorder',
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            width: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      offset: Offset(-1, 0),
                      blurRadius: 8,
                      spreadRadius: 0),
                  BoxShadow(
                      color: Theme.of(context).colorScheme.primary,
                      offset: Offset(1, 0),
                      blurRadius: 3,
                      spreadRadius: 0),
                ]),
          ),
          SizedBox(width: 20),
          Icon(Icons.arrow_forward, color: DarkColor.titleTextColor),
        ],
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context, {double borderRadius = 0}) {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            .2,
            .4,
            .7
          ],
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryVariant,
            Theme.of(context).colorScheme.primary,
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      height: MediaQuery.of(context).size.height - 150,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 80),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _pentaContainer(),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).viewPadding.top + 20,
                      left: 20,
                      child: appbarWidget()),
                  Align(alignment: Alignment.bottomCenter, child: _bottomBar())
                ],
              ),
            ))));
  }
}
