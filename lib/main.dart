import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final suggestions = <WordPair>[];
  final saved = Set<WordPair>();
  final biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup name generator"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: buildSuggestions()
    );
  }

  Widget buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10));
          }
          return buildRow(suggestions[index]);
        });
  }

  Widget buildRow(WordPair pair) {
    final isSaved = saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            saved.remove(pair);
          } else {
            saved.add(pair);
          }
        });
      },
    );
  }

  void pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Saved suggestions"),
            ),
            body: ListView(children: divided,),
          );
        },
      ),
    );
  }

}
