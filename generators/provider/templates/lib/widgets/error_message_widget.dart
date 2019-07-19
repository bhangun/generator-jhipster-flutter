

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final BuildContext context;
  final String message;
  const ErrorMessage({
    Key key, 
    this.context, 
    this.message}) : super(key: key);

  @override
  Widget build(BuildContext _context) {
   // _context = context;
    return (message != null) ?
      FlushbarHelper.createError(
        message: message,
        title: 'Error',
        duration: Duration(seconds: 3),
      ).show(context):Container();
  }
}