import 'package:flutter/material.dart';

extension NavigaterExtension on BuildContext {
  void navigateTo(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }
}
