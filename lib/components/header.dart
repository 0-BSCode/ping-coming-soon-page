import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:ping_coming_soon_page/utils/addSpace.dart';
import 'package:ping_coming_soon_page/utils/determineRootSize.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/logo.svg",
          semanticsLabel: 'PING Logo',
          width: rootSize * 3,
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
                  color: COLOR_GRAY.toColor(),
                  fontSize: rootSize * 1.25,
                ),
              ),
              TextSpan(
                text: "soon!",
                style: TextStyle(
                  fontFamily: "LibreFranklin",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: rootSize * 1.25,
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(15),
        Text(
          "Subscribe and get notified",
          style: TextStyle(
            fontFamily: "LibreFranklin",
            fontWeight: FontWeight.w600,
            fontSize: rootSize / 1.5,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
