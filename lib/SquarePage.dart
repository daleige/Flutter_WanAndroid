import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SquarePageState();
  }
}

class SquarePageState extends State<SquarePage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = ListTileStyle.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              if (i.isOdd) return const Divider();
              final index = i ~/ 2;
              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
              }
              return ListTile(
                title: Text(_suggestions[index].asPascalCase),
                style: _biggerFont,
              );
            }));
  }
}
