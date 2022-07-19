import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ping_coming_soon_page/components/header.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:ping_coming_soon_page/utils/addSpace.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ping_coming_soon_page/providers/emailTextProvider.dart';
import 'package:ping_coming_soon_page/utils/determineRootSize.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController myTextController = TextEditingController();
  String? errorText = null;

  @override
  void initState() {
    // Points to the same provider as the emailTextProvider later
    // Assigning it to variable = more concise
    final EmailTextProvider emailTextProvider =
        Provider.of<EmailTextProvider>(context, listen: false);

    super.initState();

    myTextController = TextEditingController(text: emailTextProvider.email);
  }

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      final text = myTextController.value.text;

      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text);

      if (text.isEmpty) {
        errorText = "Whoops! It looks like you forgot to add your email";
      } else if (!emailValid) {
        errorText = "Please provide a valid email address";
      } else {
        errorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    determineRootSize(context);
    final EmailTextProvider emailTextProvider =
        Provider.of<EmailTextProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            print('From container: ${constraints.maxWidth}');
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                  ),
                  child: Column(
                    children: [
                      Header(),
                      addVerticalSpace(40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: constraints.maxWidth < 768
                            ? Column(
                                children: [
                                  TextField(
                                    controller: myTextController,
                                    onChanged: (text) => {
                                      emailTextProvider.changeEmail(text),
                                    },
                                    decoration: InputDecoration(
                                      errorText: errorText,
                                      errorStyle: TextStyle(
                                        fontFamily: "LibreFranklin",
                                        fontSize: 9,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: COLOR_LIGHT_RED.toColor(),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(70),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: COLOR_LIGHT_RED.toColor(),
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(70),
                                      ),
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
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 2.0,
                                          spreadRadius: 0.5,
                                          color: COLOR_PALE_BLUE.toColor(),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        _submit();
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 23,
                                        ),
                                        backgroundColor: COLOR_BLUE.toColor(),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        primary: Colors.white,
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
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: TextField(
                                        controller: myTextController,
                                        onChanged: (text) => {
                                          emailTextProvider.changeEmail(text),
                                        },
                                        decoration: InputDecoration(
                                          errorText: errorText,
                                          errorStyle: TextStyle(
                                            fontFamily: "LibreFranklin",
                                            fontSize: 9,
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: COLOR_LIGHT_RED.toColor(),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: COLOR_LIGHT_RED.toColor(),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: COLOR_BLUE.toColor(),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: COLOR_BLUE.toColor(),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(70),
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
                                    ),
                                    Expanded(child: Container()),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 2),
                                              blurRadius: 2.0,
                                              spreadRadius: 0.5,
                                              color: COLOR_PALE_BLUE.toColor(),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            _submit();
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 23,
                                            ),
                                            backgroundColor:
                                                COLOR_BLUE.toColor(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                            ),
                                            primary: Colors.white,
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
                                    ),
                                  ],
                                ),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: COLOR_PALE_BLUE.toColor(),
                                    width: 1,
                                  ),
                                ),
                                child: Material(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {},
                                    child: Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: COLOR_BLUE.toColor(),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              addHorizontalSpace(15),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: COLOR_PALE_BLUE.toColor(),
                                    width: 1,
                                  ),
                                ),
                                child: Material(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {},
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                      color: COLOR_BLUE.toColor(),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              addHorizontalSpace(15),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: COLOR_PALE_BLUE.toColor(),
                                    width: 1,
                                  ),
                                ),
                                child: Material(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {},
                                    child: Icon(
                                      FontAwesomeIcons.instagram,
                                      color: COLOR_BLUE.toColor(),
                                      size: 20,
                                    ),
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
                      addVerticalSpace(30),
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
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
