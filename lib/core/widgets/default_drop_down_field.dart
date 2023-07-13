import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField(
      {Key? key,
      this.selectedValue,
      required this.options,
      this.onChanged,
      this.label,
      this.validator,
      this.onSaved,
      this.resetKey,
      this.onTap,
      this.enable = true,
      this.hasBottomPadding = false})
      : super(key: key);

  final dynamic selectedValue;
  final List options;
  final void Function(dynamic value)? onChanged;
  final void Function(dynamic value)? onSaved;
  final String? Function(dynamic value)? validator;
  final String? label;
  final bool hasBottomPadding;
  final VoidCallback? onTap;
  final bool enable;
  final GlobalKey<FormFieldState>? resetKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasBottomPadding
          ? const EdgeInsets.only(bottom: 25.0)
          : EdgeInsets.zero,
      child: DropdownButtonFormField<dynamic>(
        enableFeedback: enable,
        onTap: onTap,
        key: resetKey,
        value: selectedValue,
        items: options
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item is String ? item : item.title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ))
            .toList(),
        decoration: InputDecoration(
          enabled: enable,
          label: label == null
              ? null
              : Text(
                  label!,
                ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(kLargePaddingValue)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: kSmallPaddingValue,
            vertical: kExtraSmallPaddingValue,
          ),
        ),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
