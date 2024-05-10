import 'package:calme/core/ui_constant.dart';
import 'package:flutter/material.dart';

import '../core/color_values.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.isWhiteButton = false, this.fontSize, this.prefixIcon})
      : super(key: key);
  final Function()? onPressed;
  final String buttonText;
  final bool isWhiteButton;
  final double? fontSize;
  final IconData? prefixIcon;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          elevation: 0,
          backgroundColor: widget.isWhiteButton ? Colors.white : Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UiConstant.defaultBorder),
            side: BorderSide(
              color: widget.isWhiteButton ? ColorValues.text20 : Theme.of(context).primaryColor,
            )
          )
        ),
        child: FittedBox(
          child: Row(
            children: [
              if (widget.prefixIcon != null) Icon(widget.prefixIcon, size: 18, color: widget.isWhiteButton ? ColorValues.text50 : Colors.white),
              if (widget.prefixIcon != null) const SizedBox(width: UiConstant.smallerSpacing),
              Text(
                widget.buttonText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: widget.fontSize, color: widget.isWhiteButton ? ColorValues.text50 : Colors.white),
              ),
            ],
          ),
        ));
  }
}
