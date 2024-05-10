import 'package:calme/core/styles.dart';
import 'package:flutter/material.dart';

import '../core/color_values.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.backgroundColor = ColorValues.primary50,
      this.isWhiteButton = false, this.fontSize, this.prefixIcon})
      : super(key: key);
  final Function()? onPressed;
  final String buttonText;
  final bool isWhiteButton;
  final double? fontSize;
  final IconData? prefixIcon;
  final Color backgroundColor;

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
          backgroundColor: widget.isWhiteButton ? Colors.white : widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Styles.defaultBorder),
            side: BorderSide(
              color: widget.isWhiteButton ? ColorValues.text20 : Theme.of(context).primaryColor,
            )
          )
        ),
        child: FittedBox(
          child: Row(
            children: [
              if (widget.prefixIcon != null) Icon(widget.prefixIcon, size: 18, color: widget.isWhiteButton ? ColorValues.text50 : Colors.white),
              if (widget.prefixIcon != null) const SizedBox(width: Styles.smallerSpacing),
              Text(
                widget.buttonText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: widget.fontSize ?? 14, color: widget.isWhiteButton ? ColorValues.text50 : Colors.white),
              ),
            ],
          ),
        ));
  }
}
