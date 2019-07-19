import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../bloc/alert/index.dart';

class KutAlert extends StatelessWidget {
  
  const KutAlert({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _alertKey = GlobalKey<State>();
    AlertBloc _alertBloc = Provider.of<AlertBloc>(context);
     
    return ChangeNotifierProvider(builder: (_) => AlertBloc()
    , child: AlertDialog( key: _alertKey,
                        title: Text(_alertBloc.title),
                        content: Text(_alertBloc.dialogContent),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: _alertBloc.onDialogCancel,
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: _alertBloc.onDialogOk,
                          ),
                        ],
                        
                      ));
  }
}