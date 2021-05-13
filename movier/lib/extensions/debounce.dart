import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  // ignore: type_annotate_public_apis
  call(VoidCallback action) async {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  // ignore: always_declare_return_types
  dispose() async {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
