import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});
  static const routeName = '/screen2';
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      (Text(arguments['dataReciever'].toString())),
      
    ])));
  }
}
