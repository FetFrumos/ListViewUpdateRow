import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:listviewrowupdate/utils.dart';

class MyListTile extends StatefulWidget {
  final _MyListTileState _state;

  MyListTile(WordPair wordPair, bool isSaved, Function stateChangeOnTap, CheckSaved checkSaved):
        _state = _MyListTileState(wordPair, isSaved, stateChangeOnTap, checkSaved);

  @override
  State<StatefulWidget> createState() => _state;
}

class _MyListTileState extends State<MyListTile> {

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  WordPair wordPair;
  bool isSaved;
  Function stateChangeOnTap;
  CheckSaved checkSaved;

  _MyListTileState(this.wordPair, this.isSaved, this.stateChangeOnTap, this.checkSaved);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool tmp = checkSaved(wordPair);
    return new ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        tmp ? Icons.favorite : Icons.favorite_border,
        color: tmp ? Colors.red : null,
      ),
      onTap: () {
        setState(stateChangeOnTap);
      },
    );
  }
}
