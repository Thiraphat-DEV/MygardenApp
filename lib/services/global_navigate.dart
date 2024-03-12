import 'package:flutter/material.dart';

class GlobalNavigate {
  static navigateTo({required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
}
