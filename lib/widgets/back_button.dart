import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'rounded_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.backgroundColor, this.iconColor}) : super(key: key);
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      color: backgroundColor,
      onTap: () {
        AutoRouter.of(context).pop();
      },
      child: Icon(UniconsLine.arrow_left, color: iconColor ?? Colors.black),
    );
  }
}
