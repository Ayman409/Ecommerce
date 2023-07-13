import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg, Color bgColor = Colors.red}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      fontSize: 16.0);
}

void showCustomDialog(BuildContext context, Widget dialog) {
  showDialog(context: context, builder: (context) => dialog);
}
