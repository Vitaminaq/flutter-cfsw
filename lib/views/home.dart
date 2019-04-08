import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../api/chatroom.dart';
import '../model/chatroom.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(
        backgroundColor: Color(0xFF00dcFF),
        centerTitle: true,
        title: Text('Confenssion Wall',
            style: TextStyle(color: Colors.white.withOpacity(1.0))),
      ),
      body: _buildSuggestions(),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.control_point), title: Text('发表')),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Color(0xFF00dcFF),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    final params = {
      'limit': 9,
      'page': 0
    };
    final res = await api.getArtic(params);
    print(ChatRoomModel.fromJson(res.data));
  }

  // void _pushSaved() {
  //   Navigator.of(context).push(
  //     new MaterialPageRoute<void>(
  //       builder: (BuildContext context) {
  //         final Iterable<ListTile> tiles = _saved.map(
  //           (WordPair pair) {
  //             return new ListTile(
  //               title: new Text(
  //                 pair.asPascalCase,
  //                 style: _biggerFont,
  //               ),
  //             );
  //           },
  //         );
  //         final List<Widget> divided = ListTile.divideTiles(
  //           context: context,
  //           tiles: tiles,
  //         ).toList();
  //         return new Scaffold(
  //           appBar: new AppBar(
  //             title: const Text('Saved Suggestions'),
  //           ),
  //           body: new ListView(children: divided),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
    // return ListView(
    //   padding: const EdgeInsets.all(16.0),
    //   children: <Widget>[_buildRow(res)],
    // );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
