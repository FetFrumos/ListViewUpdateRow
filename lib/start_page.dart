import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'my_list_tile.dart';
class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('ListView update row'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider();
        }
        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair wordPair) {
    return MyListTile(wordPair, _saved.contains(wordPair), () {
      print("$wordPair is saved ${_saved.contains(wordPair)}");

      setState(() {
        final isSaved = _saved.contains(wordPair);
        isSaved ? _saved.remove(wordPair) : _saved.add(wordPair);
      });
    }, checkSaved);
  }

  bool checkSaved(WordPair wordPair){
    return _saved.contains(wordPair);
  }

}
