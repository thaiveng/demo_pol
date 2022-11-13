import 'package:connect_pol/plugin_foo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelendraConnection extends ChangeNotifier{
  
  PluginFoo _selNetwork = PluginFoo();
  
  Future<void> startPlugin() async {
    try {

      await rootBundle.loadString("js_api/dist/main.js").then((value) async {

        await _selNetwork.getKeyring.init([204]);
        print("Finish init getKeyring");

        await _selNetwork.beforeStart(_selNetwork.getKeyring, jsCode: value);
        // await _selNetwork.getSdk.init(_selNetwork.getKeyring, jsCode: value);
        // print("_selNetwork.sdk.api.connectedNode ${_selNetwork.getSdk.api.connectNode(keyringStorage, nodes)}");
        // print(_selNetwork.sdk.api ?? "fuck null"); //.connectNode(_selNetwork.getKeyring, [_selNetwork.networkParams!]);
        await _selNetwork.sdk.api.connectNode(_selNetwork.getKeyring, _selNetwork.nodeList);
        await _selNetwork.sdk.webView!.evalJavascript("settings.getChainDecimal(api)").then((value) {
          print("getChainDecimal $value");
        });

        await _selNetwork.sdk.webView!.evalJavascript("account.getBalance(api, 'sesqQz7ePB8vrc9wrQfq4M6Rvk73DqiqA1JS3HDhn4V2KfGd9', 'Balance')").then((value) {
          print("getChainDecimal $value");
        });

        print("_selNetwork.sdk.webView.webViewLoaded ${_selNetwork.sdk.webView!.webViewLoaded}");
        // await _selNetwork.sdk.webView!.evalJavascript("keyring.validateMnemonic('dentist body neglect clay stage forget caught bacon moment gown toast kind')").then((value) {
        //   print("checkMnemonicValid $value");
        // });
      });
    } catch (e){
      print("Error startPlugin $e");
    }
  }
}