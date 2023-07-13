import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DefaultElevatedButtonWithWidthFactor extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double widthFactor;
  final double? height;


  const DefaultElevatedButtonWithWidthFactor({
    Key? key,
    required this.text,
    required this.onPressed,
    this.widthFactor = 0.6,
   
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: SizedBox(
        height: height,
        
        child: ElevatedButton(
          onPressed: onPressed,
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style:  const TextStyle(
                    color: mainTextColor2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)
                ,
          ),
        ),
      ),
    );
  }
}

class DefaultElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? buttonColor;
 
  const DefaultElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,

    this.width,
    this.height, this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(40)
        ),
        child: Text(
          text,
         
          style:  const TextStyle(
                  color: mainTextColor2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
              
        ),
      ),
    );
  }
}
