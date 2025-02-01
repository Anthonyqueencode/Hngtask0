import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class gitRepo extends StatelessWidget {
  static const platform = MethodChannel('open.browser/channel');

  void openLinks(String url) async {
    if (Platform.isAndroid || Platform.isIOS) {
      try {
        await platform.invokeMethod('openBrowser', {'url': url});
      } on PlatformException catch (e) {
        print("Browser failed to open: '${e.message}'.");
      }
    } else {
      print("platform issues occured.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('HNG-TASK-0'),backgroundColor: Colors.blueAccent,),
        body: Center(
         
            child: Column( 
              children: [
                 ElevatedButton(onPressed: () => openLinks("https://github.com/Anthonyqueencode/Hngtask0"),
                //          (){ openURL('https://github.com'
                // );},
               
              child: Text('VISIT GitHub REPO')),
              ElevatedButton(onPressed: ()=> openLinks("https://hng.tech/hire/android-developers"),
              child: Text('HIRE AN ANDROID DEVELOPER')),
              ElevatedButton(onPressed: ()=> openLinks("https://telex.im"),
               child: Text('GOTO TELEX')),
              ElevatedButton(onPressed: ()=> openLinks("https://delve.fun"),
               child: Text('VISIT DELVE')),
              ],
            ),
          
        ),
      ),
    );
  }
}

void main() {
  runApp(gitRepo());
}
