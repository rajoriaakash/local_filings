import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_filings/dimensions.dart';

class CustomTextField extends StatefulWidget {
  final double bottomPadding;
  final TextEditingController? controller;
  final String errorText;
  final String? hintText;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final bool? isEnabled;
  final bool isIcon;
  final bool isPassword;
  final bool? isShowBorder;
  final bool isShowSuffixIcon;
  final String label;
  final int? maxLines;
  final VoidCallback? onChanged;
  final VoidCallback? onSubmit;
  final VoidCallback? onSuffixTap;
  final bool required;
  final IconData? suffixIconUrl;
  final FormFieldValidator<String>? validator;

  CustomTextField({
    this.bottomPadding = 10,
    this.controller,
    this.errorText = "",
    this.hintText,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.isIcon = false,
    this.isPassword = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.label = "",
    this.maxLines = 1,
    this.onChanged,
    this.onSubmit,
    this.onSuffixTap,
    this.required = true,
    this.suffixIconUrl,
    this.validator,
  });

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
        width: Dimensions.getWidth(context, 366),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFF0F5FF),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.getWidth(context, 25),
            vertical: Dimensions.getHeight(context, 5)),
        child: Column(
          children: [
            Center(
              child: TextFormField(
                maxLines: widget.maxLines,
                controller: widget.controller,
                textInputAction: widget.inputAction,
                keyboardType: widget.inputType,
                cursorColor: Theme.of(context).primaryColor,
                enabled: widget.isEnabled,
                obscureText: widget.isPassword ? _obscureText : false,
                validator: widget.validator,
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
                  // error text to display after validation
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
