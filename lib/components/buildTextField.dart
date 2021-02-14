import 'package:flutter/material.dart';
import '../constants.dart';

class BuildTextField extends StatelessWidget {
  final String labelText, hintText;
  final bool enabled;
  final Function validator;
  final Function onSaved;
  final bool obscureText;
  const BuildTextField(
      {Key key,
      this.hintText,
      this.labelText,
      this.enabled,
      this.validator,
      this.onSaved,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kTextFormFieldPadding,
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        enabled: enabled,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: hintText,
          labelStyle: kLabelTextStyle,
          hintStyle: kHintTextStyle,
          focusedBorder: kInputBorder,
        ),
      ),
    );
  }
}
