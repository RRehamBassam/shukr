import 'package:flutter/foundation.dart';
class providerUser with ChangeNotifier, DiagnosticableTreeMixin {
  String _tokenUser = "";
  String _city = "";

  String get tokenUser => _tokenUser;

  void increment(String val) {
    _tokenUser=val;
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