import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final VoidCallback? onEyePressed;
  final bool? isEyeOpen;
  final bool showEye;

  const TextFieldWidget({
    // Key key,
    this.icon,
    this.hint,
    this.errorText,
    this.isObscure = false,
    this.inputType,
    this.textController,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.autoFocus = false,
    this.inputAction,
    this.onEyePressed,
    this.isEyeOpen,
    this.showEye = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      TextFormField(
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: 25,
        keyboardType: this.inputType,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
            hintText: this.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: hintColor),
            errorText: errorText,
            counterText: '',
            icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
      ),
      showEye
          ? IconButton(splashRadius: 15,
            color: Theme.of(context).buttonColor,
              onPressed: onEyePressed,
              icon: Icon(isEyeOpen! ? Icons.visibility : Icons.visibility_off))
          : Container()
    ]);
  }
}
