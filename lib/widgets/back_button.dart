import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'rounded_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onTap: () {
        AutoRouter.of(context).pop();
      },
      child: const Icon(UniconsLine.arrow_left, color: Colors.black),
    );
  }
}
