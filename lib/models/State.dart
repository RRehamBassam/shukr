import 'package:flutter/foundation.dart';
class providerState with ChangeNotifier, DiagnosticableTreeMixin {
  int _State = 1;
  String _city = "";

  int get tokenUser => _State;
  String get city => _city;
  void cityEdit(String val) {
    _city=val;
    // _tokenUser++;
    notifyListeners();
  }
  void increment(int val) {
    _State=val;
    // _tokenUser++;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', tokenUser));
  }
}