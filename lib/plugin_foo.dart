import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/plugin/homeNavItem.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/polkawallet_sdk.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';

class PluginFoo extends PolkawalletPlugin{

  final _keyring = Keyring();

  Keyring get getKeyring => _keyring;

  NetworkParams? networkParams;

  // 3.1
  @override
  final basic = PluginBasicData(

  );

  // 3.2
  @override
  final Map<String, Widget> tokenIcons = {
    'SEL': Image.asset("assets/logos/bitriel-splash.png")
  };

  // 3.3
  @override
  List<NetworkParams> get nodeList {
    const node_list = [
      {
        'name': "Selendra",
        'ss58': 204,
        'endpoint': 'wss://rpc-mainnet.selendra.org'
      }
    ];
    return node_list.map((e) => NetworkParams.fromJson(e)).toList();
  } 

  // 3.4
  @override
  List<HomeNavItem> getNavItems(BuildContext context, Keyring keyring){
    return [
      HomeNavItem(
        text: "Selendra", 
        content: Container()
      )
    ];
  }

  // 3.6
  @override
  Map<String, WidgetBuilder> getRoutes(Keyring keyring){
    return {

    };
  }
  
  // 3.7
  @override
  Future<String> loadJSCode() async => await rootBundle.loadString("js_api/dist/main.js");

}