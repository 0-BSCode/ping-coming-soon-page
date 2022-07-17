import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:ping_coming_soon_page/utils/addSpace.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 60,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/logo.svg",
                      semanticsLabel: 'PING Logo',
                    ),
                    addVerticalSpace(60),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "We are launching ",
                            style: TextStyle(
                              fontFamily: "LibreFranklin",
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: "soon!",
                            style: TextStyle(
                              fontFamily: "LibreFranklin",
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(30),
                    Text(
                      "Subscribe and get notified",
                      style: TextStyle(
                        fontFamily: "LibreFranklin",
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 0.5,
                      ),
                    ),
                    addVerticalSpace(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: COLOR_BLUE.toColor(),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: COLOR_BLUE.toColor(),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              labelText: "Your email address...",
                              labelStyle: TextStyle(
                                fontFamily: 'LibreFranklin',
                                fontWeight: FontWeight.w300,
                                color: COLOR_GRAY.toColor(),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 35,
                              ),
                            ),
                          ),
                          addVerticalSpace(15),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(4),
                                shadowColor: MaterialStateProperty.all(
                                  COLOR_BLUE.toColor(),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                    vertical: 25,
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  COLOR_BLUE.toColor(),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Notify Me",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'LibreFranklin',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(70),
                    Image.asset(
                      "assets/images/illustration-dashboard.png",
                      fit: BoxFit.contain,
                    ),
                    addVerticalSpace(150),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(
                                  color: COLOR_PALE_BLUE.toColor(),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: COLOR_BLUE.toColor(),
                                  size: 20,
                                ),
                              ),
                            ),
                            addHorizontalSpace(15),
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(
                                  color: COLOR_PALE_BLUE.toColor(),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.twitter,
                                  color: COLOR_BLUE.toColor(),
                                  size: 20,
                                ),
                              ),
                            ),
                            addHorizontalSpace(15),
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                border: Border.all(
                                  color: COLOR_PALE_BLUE.toColor(),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                  color: COLOR_BLUE.toColor(),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                    addVerticalSpace(20),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.copyright,
                              color: COLOR_GRAY.toColor(),
                              size: 13,
                            ),
                          ),
                          WidgetSpan(
                            child: addHorizontalSpace(5),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Text(
                              "Copyright Ping. All rights reserved",
                              style: TextStyle(
                                fontFamily: 'LibreFranklin',
                                color: COLOR_GRAY.toColor(),
                              ),
                            ),
                          ),
                          // TextSpan(
                          //   text: "Copyright Ping. All rights reserved",
                          //   style: TextStyle(
                          //     fontFamily: 'LibreFranklin',
                          //     color: COLOR_GRAY.toColor(),
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
