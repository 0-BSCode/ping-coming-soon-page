import 'package:flutter/material.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ButtonIcon extends StatelessWidget {
  final IconData iconData;
  const ButtonIcon({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    return Container(
      width: rootSize * 2,
      height: rootSize * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rootSize * 5 / 2),
        border: Border.all(
          color: COLOR_PALE_BLUE.toColor(),
          width: 1,
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(rootSize * 5 / 2),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(rootSize * 5 / 2),
          onTap: () {},
          child: Icon(
            iconData,
            color: COLOR_BLUE.toColor(),
            size: rootSize,
          ),
        ),
      ),
    );
  }
}
