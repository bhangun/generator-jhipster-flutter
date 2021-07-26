import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const RoundedButtonWidget({
    this.buttonText,
    this.buttonColor,
    this.textColor = Colors.white,
    this.onPressed,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //color: buttonColor,
      //shape: StadiumBorder(),
      onPressed: onPressed,
      child: Text(
        buttonText!,
        //style: Theme.of(context).textTheme.button.copyWith(color: textColor),
      ),
    );
  }
}
