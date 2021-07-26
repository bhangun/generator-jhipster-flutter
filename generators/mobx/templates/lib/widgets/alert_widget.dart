import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KutAlert extends StatelessWidget {
  final String? title;
  final Function onCancel;
  final Function onOk;
  final String? content;
  final String cancelTitle;
  final String okTitle;
  const KutAlert(
      {
      this.title,
      this.content,
      required this.onCancel,
      required this.onOk,
      this.cancelTitle='Cancel',
      this.okTitle='Ok'});
     

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      title: Text(title!),
      content: Text(content!),
      actions: <Widget>[
        /* FlatButton(
          child: Text(cancelTitle),
          onPressed: onCancel,
        ),
        FlatButton(
          child: Text(okTitle),
          onPressed: onOk,
        ), */
      ],
    );
  }
}
