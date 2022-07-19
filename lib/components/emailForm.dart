import 'package:flutter/material.dart';
import 'package:ping_coming_soon_page/providers/emailTextProvider.dart';
import 'package:ping_coming_soon_page/utils/determineRootSize.dart';
import 'package:provider/provider.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:ping_coming_soon_page/utils/addSpace.dart';

class EmailForm extends StatefulWidget {
  EmailForm({Key? key}) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  TextEditingController myTextController = TextEditingController();
  String? errorText = null;

  @override
  void initState() {
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
      final text = myTextController.text;
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
    final EmailTextProvider emailTextProvider =
        Provider.of<EmailTextProvider>(context);
    final double width = MediaQuery.of(context).size.width;
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: rootSize * 1 / 2,
      ),
      child: width < deviceSizes['sm']!
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
                      fontSize: rootSize * 9 / 20,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: COLOR_LIGHT_RED.toColor(),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(rootSize * 4),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: COLOR_LIGHT_RED.toColor(),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(rootSize * 4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: COLOR_BLUE.toColor(),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(rootSize * 4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: COLOR_BLUE.toColor(),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(rootSize * 4),
                    ),
                    labelText: "Your email address...",
                    labelStyle: TextStyle(
                      fontFamily: 'LibreFranklin',
                      fontWeight: FontWeight.w300,
                      color: COLOR_GRAY.toColor(),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: rootSize * 3 / 2,
                      vertical: rootSize * 4 / 5,
                    ),
                  ),
                ),
                addVerticalSpace(rootSize * 3 / 4),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, rootSize * 1 / 10),
                        blurRadius: rootSize * 1 / 10,
                        spreadRadius: rootSize * 1 / 40,
                        color: COLOR_PALE_BLUE.toColor(),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(rootSize * 4),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _submit();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: rootSize * 21 / 20,
                      ),
                      backgroundColor: COLOR_BLUE.toColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      primary: Colors.white,
                    ),
                    child: Text(
                      "Notify Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'LibreFranklin',
                        fontWeight: FontWeight.w600,
                        fontSize: rootSize * 13 / 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: rootSize * 1 / 2,
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
                          fontSize: rootSize * 9 / 20,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: COLOR_LIGHT_RED.toColor(),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(rootSize * 7 / 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: COLOR_LIGHT_RED.toColor(),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(rootSize * 7 / 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: COLOR_BLUE.toColor(),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(rootSize * 7 / 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: COLOR_BLUE.toColor(),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(rootSize * 7 / 2),
                        ),
                        labelText: "Your email address...",
                        labelStyle: TextStyle(
                          fontFamily: 'LibreFranklin',
                          fontWeight: FontWeight.w300,
                          color: COLOR_GRAY.toColor(),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: rootSize * 3 / 2,
                          vertical: rootSize * 3 / 5,
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
                            offset: Offset(0, rootSize * 1 / 10),
                            blurRadius: rootSize * 1 / 10,
                            spreadRadius: rootSize * 1 / 40,
                            color: COLOR_PALE_BLUE.toColor(),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(rootSize * 3),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _submit();
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: rootSize * 4 / 5,
                          ),
                          backgroundColor: COLOR_BLUE.toColor(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(rootSize * 3),
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
    );
  }
}
