import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class EmailTextProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _email = '';

  // Getter function
  String get email => _email;

  void changeEmail(String newText) {
    _email = newText;
    notifyListeners();
  }

  // Makes provider viewable on devtools
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("Email", _email));
  }
}
