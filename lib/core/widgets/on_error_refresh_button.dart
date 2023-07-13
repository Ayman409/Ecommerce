import 'package:flutter/material.dart';

class OnErrorRefreshButton extends StatelessWidget {
  const OnErrorRefreshButton(
      {Key? key,
      this.errorMsg = 'حدث خطأ ما حاول مجدداً',
      this.onRefreshPressed})
      : super(key: key);

  final String errorMsg;
  final VoidCallback? onRefreshPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMsg,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 20),
        IconButton(
          onPressed: onRefreshPressed,
          icon: const Icon(Icons.refresh),
          iconSize: 50,
        )
      ],
    );
  }
}
