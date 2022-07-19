import 'package:flutter/material.dart';
import 'package:ping_coming_soon_page/providers/rootSizeProvider.dart';
import 'package:provider/provider.dart';

const Map<String, double> deviceSizes = {
  'xs': 575,
  'sm': 767,
  'md': 991,
  'lg': 1119,
  'xl': 1399,
};

void determineRootSize(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  final RootSizeProvider rootSizeProvider =
      Provider.of<RootSizeProvider>(context);
  if (width < deviceSizes['xs']!) {
    rootSizeProvider.setRootSize(25.0);
  } else if (width < deviceSizes['sm']!) {
    rootSizeProvider.setRootSize(28.0);
  } else if (width < deviceSizes['md']!) {
    rootSizeProvider.setRootSize(30.0);
  } else if (width < deviceSizes['lg']!) {
    rootSizeProvider.setRootSize(33.0);
  } else if (width < deviceSizes['xl']!) {
    rootSizeProvider.setRootSize(35.0);
  } else {
    rootSizeProvider.setRootSize(38.0);
  }
}
