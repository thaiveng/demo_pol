import 'package:connect_pol/plugin_foo.dart';
import 'package:flutter/material.dart';

class SelendraConnection extends ChangeNotifier{
  
  PluginFoo _selNetwork = PluginFoo();


  Future<void> startPlugin() async {
    print("_startPlugin");
    await _selNetwork.getKeyring.init([2, 204]);
    print("Finish init getKeyring");
    await _selNetwork.beforeStart(_selNetwork.getKeyring);
    print("Finish beforeStart");
    
    final connected = await _selNetwork.start(_selNetwork.getKeyring);
    print("connected ${connected!.toJson()}");

    _selNetwork.networkParams = connected;
    print("Hello");
  }
}