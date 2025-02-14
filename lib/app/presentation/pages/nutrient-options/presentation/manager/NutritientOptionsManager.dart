import 'package:flutter/material.dart';

class NutritientOptionsManager {
  void redirectTo(BuildContext context, var anotherClass) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => anotherClass));
  }
}
