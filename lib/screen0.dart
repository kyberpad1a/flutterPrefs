import 'package:flutter/material.dart';
import 'package:flutter_prefs/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dataTransfer = "";
  late SharedPreferences sharedPreferences;


  @override
  Future<void> initShared() async{
    sharedPreferences = await SharedPreferences.getInstance();
        if (sharedPreferences.containsKey('dataTransfer')) 
    {
      Navigator.pushNamed(context, Screen.routeName, arguments: {
        'dataReciever': sharedPreferences.getString('dataTransfer'),
      });
    }
  }

  @override
  void initState(){
    initShared().then((value) {
      dataTransfer = sharedPreferences.getString('dataTransfer') ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                    onChanged: (value) {
                sharedPreferences.setString('dataTransfer', value);
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, Screen.routeName, arguments: {'dataReciever': sharedPreferences.getString('dataTransfer')});
            }, child: Text('Переход')),
          ],
        ),
      ),
      
    );
  }
}