import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

class CustomSimpleDialog extends StatelessWidget {
  const CustomSimpleDialog({
    super.key,
    required this.children,
  });

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kExtraLargePaddingValue),
            child: Column(mainAxisSize: MainAxisSize.min, children: children),
          ),
        ),
      ),
    );
  }
}
