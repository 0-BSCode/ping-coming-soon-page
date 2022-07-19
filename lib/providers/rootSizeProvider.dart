import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RootSizeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double _rootSize = 20.0;

  double get rootSize => _rootSize;

  void setRootSize(double newSize) {
    _rootSize = newSize;
    // No notify listeners bc only time this is called
    // is on build time, where no listeners exist
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("Root Size", _rootSize));
  }
}
