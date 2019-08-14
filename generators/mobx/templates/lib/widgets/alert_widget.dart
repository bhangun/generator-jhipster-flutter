import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:<%= appsName %>/bloc/alert/alert_bloc.dart';

class KutAlert extends StatelessWidget {
  
  const KutAlert({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _alertKey = GlobalKey<State>();
    final _alertStore = AlertStore();
     
    return AlertDialog( key: _alertKey,
                        title: Text(_alertStore.title),
                        content: Text(_alertStore.dialogContent),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: _alertStore.onDialogCancel,
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: _alertStore.onDialogOk,
                          ),
                        ],
                        
                      );
  }
}