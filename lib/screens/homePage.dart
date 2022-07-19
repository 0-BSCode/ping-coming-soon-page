import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ping_coming_soon_page/components/buttonIcon.dart';
import 'package:ping_coming_soon_page/components/emailForm.dart';
import 'package:ping_coming_soon_page/components/footer.dart';
import 'package:ping_coming_soon_page/components/header.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
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
    final width = MediaQuery.of(context).size.width;
    final EmailTextProvider emailTextProvider =
        Provider.of<EmailTextProvider>(context);
    debugPrint('${width}');
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: width < deviceSizes['sm']!
                        ? rootSize * 3 / 2
                        : rootSize * 5,
                  ),
                  child: Column(
                    children: [
                      Header(),
                      addVerticalSpace(40),
                      EmailForm(),
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
                              ButtonIcon(iconData: FontAwesomeIcons.facebookF),
                              addHorizontalSpace(rootSize * 3 / 4),
                              ButtonIcon(iconData: FontAwesomeIcons.twitter),
                              addHorizontalSpace(rootSize * 3 / 4),
                              ButtonIcon(iconData: FontAwesomeIcons.instagram),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                      addVerticalSpace(30),
                      Footer(),
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
