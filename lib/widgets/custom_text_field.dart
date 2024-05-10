import 'package:calme/core/color_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      this.validator,
      this.isRequired = true,
      this.isPassword = false,
      this.isDense = false,
      this.label,
      this.hint,
      this.icon,
      this.textInputType, this.onChanged})
      : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isRequired, isPassword, isDense;
  final String? label;
  final String? hint;
  final IconData? icon;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = true;

  OutlineInputBorder _getBorder({Color color = ColorValues.primary10}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color, width: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) RichText(
            text: TextSpan(
                text: widget.label,
                style: Theme.of(context).textTheme.displaySmall,
                children: [
              if (widget.isRequired)
                const TextSpan(
                    text: '*', style: TextStyle(color: ColorValues.danger50))
            ])),
        if (widget.label != null) const SizedBox(height: 8),
        TextFormField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          validator: widget.validator,
          style: Theme.of(context).textTheme.displaySmall,
          obscureText: widget.isPassword ? _isShowPassword : false,
          keyboardType: widget.textInputType ?? TextInputType.text,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorValues.grey50),
            filled: true,
            fillColor: Colors.white,
            border: _getBorder(),
            isDense: widget.isDense,
            focusedBorder: _getBorder(color: ColorValues.primary50),
            enabledBorder: _getBorder(),
            disabledBorder: _getBorder(),
            errorBorder: _getBorder(color: ColorValues.danger50),
            focusedErrorBorder: _getBorder(color: ColorValues.danger50),
            prefixIcon: widget.icon == null ? null : Icon(
              widget.icon,
              size: 5.5.w,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 60,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    child: Icon(
                      size: 5.5.w,
                      _isShowPassword ? UniconsLine.eye_slash : UniconsLine.eye,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
