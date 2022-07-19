import 'package:flutter/material.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:ping_coming_soon_page/utils/addSpace.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(
              Icons.copyright,
              color: COLOR_GRAY.toColor(),
              size: rootSize * 13 / 20,
            ),
          ),
          WidgetSpan(
            child: addHorizontalSpace(rootSize * 1 / 4),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              "Copyright Ping. All rights reserved",
              style: TextStyle(
                fontFamily: 'LibreFranklin',
                color: COLOR_GRAY.toColor(),
                fontSize: rootSize * 13 / 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
