import 'package:flutter/material.dart';
import 'package:startup_app/randomWords.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}


/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      //home: new RandomWords(),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new FlatButton(
            child: const Text('FLAT BUTTON'),
            onPressed: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (context) {
                    return RandomWords();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}*/