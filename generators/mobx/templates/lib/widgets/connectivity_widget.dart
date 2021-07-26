import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityWidget extends StatefulWidget {
  ConnectivityWidget({Key? key}) : super(key: key);

  @override
  _ConnectivityWidgetState createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isConnected = false;
  String _connectionInfo = 'Disconnected!';

  var subscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile) {
      setState(() {
        _connectionInfo = 'You are connected to mobile! ';
        _isConnected = true;
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        _connectionInfo = 'You are connected to wifi! ';
        _isConnected = true;
      });
    } else {
      setState(() {
        _connectionInfo = 'Offline ';
        _isConnected = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}