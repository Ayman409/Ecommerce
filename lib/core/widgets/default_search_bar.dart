import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController searchController;
  final VoidCallback onSearchIconPressed;
  final Widget? prefixIcon;
  const SearchBar({
    Key? key,
    required this.label,
    this.prefixIcon,
    required this.hintText,
    required this.onSearchIconPressed,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: Text(label),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
            vertical: kExtraSmallPaddingValue, horizontal: kSmallPaddingValue),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kLargePaddingValue),
          ),
        ),
        suffixIcon: IconButton(
            onPressed: onSearchIconPressed, icon: const Icon(Icons.search)),
      ),
      onSubmitted: (_) => onSearchIconPressed,
    );
  }
}
