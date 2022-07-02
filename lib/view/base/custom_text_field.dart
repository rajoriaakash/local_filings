import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_filings/dimensions.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool isIcon;
  final int? maxLines;
  final bool isPassword;
  final bool? isShowBorder;
  final String errorText;
  final bool isShowSuffixIcon;
  final VoidCallback? onSuffixTap;
  final IconData? suffixIconUrl;
  final VoidCallback? onSubmit;
  final bool? isEnabled;
  final VoidCallback? onChanged;
  final double bottomPadding;

  CustomTextField(
      {this.label = "",
      this.hintText,
      this.controller,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.isIcon = false,
      this.maxLines = 1,
      this.isPassword = false,
      this.isShowBorder = false,
      this.errorText = "",
      this.isShowSuffixIcon = false,
      this.onSuffixTap,
      this.suffixIconUrl,
      this.onSubmit,
      this.isEnabled = true,
      this.onChanged,
      this.bottomPadding = 10});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return Padding(
      padding: EdgeInsets.only(
          bottom: Dimensions.getHeight(context, widget.bottomPadding)),
      child: Container(
        height: Dimensions.getHeight(context, 63),
        width: Dimensions.getWidth(context, 366),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFF0F5FF),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.getWidth(context, 25)),
        child: Center(
          child: TextField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            cursorColor: Theme.of(context).primaryColor,
            enabled: widget.isEnabled,
            obscureText: widget.isPassword ? _obscureText : false,
            inputFormatters: widget.inputType == TextInputType.phone
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                  ]
                : null,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              label: Text(
                widget.label,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              isDense: true,
              hintText: widget.hintText,
              border: InputBorder.none,
              errorText: widget.errorText,
              errorStyle: TextStyle(
                fontSize: 10,
                color: Colors.red
              ),
              suffixIcon: widget.isShowSuffixIcon
                  ? widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obscureText
                                ? Color(0xFF0C55EC)
                                : Color(0xFFBCBEBC),
                          ),
                          onPressed: _toggle)
                      : widget.isIcon
                          ? IconButton(
                              onPressed: widget.onSuffixTap,
                              icon: Icon(
                                widget.suffixIconUrl,
                              ))
                          : null
                  : null,
            ),
            // onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
