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
  final bool required;
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
      this.required = true,
      this.onSubmit,
      this.isEnabled = true,
      this.onChanged,
      this.bottomPadding = 10});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  //used to control password visibility
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    void _toggle() {
      //function to change password visibility
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    //Text Field
    return Container(
      padding: EdgeInsets.only(
          bottom: Dimensions.getHeight(context, widget.bottomPadding)),
      child: Container(
        height: widget.errorText.isEmpty
            ? Dimensions.getHeight(context, 63)
            : Dimensions.getHeight(context, 83),
        width: Dimensions.getWidth(context, 366),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFF0F5FF),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.getWidth(context, 25)),
        child: Column(
          children: [
            Center(
              child: TextField(
                maxLines: widget.maxLines,
                controller: widget.controller,
                textInputAction: widget.inputAction,
                keyboardType: widget.inputType,
                cursorColor: Theme.of(context).primaryColor,
                enabled: widget.isEnabled,
                obscureText: widget.isPassword ? _obscureText : false,
                //format input if entered value is mobile number
                inputFormatters: widget.inputType == TextInputType.phone
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                      ]
                    : null,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  //text field label
                  label: Text(
                    widget.label,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  isDense: true,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  //error text to display after validation
                  errorText: widget.errorText.isEmpty ? null : widget.errorText,
                  errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
                  //Suffix icon
                  suffixIcon: widget.isShowSuffixIcon
                      ? widget.isPassword
                          ? IconButton(
                              //If field is password show visibility icon
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: _obscureText
                                    ? const Color(0xFFBCBEBC)
                                    : const Color(0xFF0C55EC),
                              ),
                              onPressed: _toggle)
                          : widget.isIcon //else show different icon as specified
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
          ],
        ),
      ),
    );
  }
}
