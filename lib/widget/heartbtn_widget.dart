import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/services/global_utils.dart';

class HeartBtnWidget extends StatelessWidget {
  const HeartBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    return GestureDetector(
      onTap: () {
        print('liked');
      },
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
