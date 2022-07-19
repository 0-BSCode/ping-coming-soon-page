import 'package:flutter/material.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
import 'package:ping_coming_soon_page/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ping_coming_soon_page/utils/determineRootSize.dart';
import 'package:provider/provider.dart';

class ButtonIcon extends StatelessWidget {
  final IconData iconData;
  const ButtonIcon({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rootSize = Provider.of<RootSizeProvider>(context).rootSize;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width < deviceSizes['sm']! ? rootSize * 2 : rootSize * 3 / 2,
      height: width < deviceSizes['sm']! ? rootSize * 2 : rootSize * 3 / 2,
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
            size: width < deviceSizes['sm']! ? rootSize : rootSize * 3 / 5,
          ),
        ),
      ),
    );
  }
}
