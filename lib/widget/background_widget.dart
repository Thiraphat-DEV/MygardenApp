import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/services/global_utils.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(IconlyBold.arrowLeftSquare, color: color,),
    );
  }
}
