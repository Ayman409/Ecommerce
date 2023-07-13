import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final String? initialValue;
  final bool obscureText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final bool? enabled;
  final TextInputType? textInputType;
  const DefaultTextField({
    Key? key,
    required this.label,
    this.textInputType,
    this.maxLines = 1,
    this.initialValue,
    this.obscureText = false,
    this.onTap,
    this.enabled,
    this.onChanged,
    this.onSubmitted,
    this.onSaved,
    this.validator,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: textController,
      maxLines: maxLines,
      initialValue: initialValue,
      obscureText: obscureText,
      onTap: onTap,
      keyboardType: textInputType,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
        contentPadding: const EdgeInsets.symmetric(
            vertical: kExtraSmallPaddingValue, horizontal: kSmallPaddingValue),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kLargePaddingValue),
          ),
        ),
      ),
    );
  }
}
