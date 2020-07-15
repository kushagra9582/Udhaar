import 'package:flutter/material.dart';
import 'package:udhar/dashboard.dart';
import 'dart:math';

class searchList extends StatefulWidget {
  final List litems;

  searchList({Key key, @required this.litems}) : super(key: key);
  @override
  searchListState createState() => searchListState();
}

String firstLetterWord(String str) {
  String result = "";

  // Traverse the string.
  bool v = true;
  for (int i = 0; i < str.length; i++) {
    // If it is space, set v as true.
    if (str[i] == ' ')
      v = true;

    // Else check if v is true or not.
    // If true, copy character in output
    // string and set v as false.
    else if (str[i] != ' ' && v == true) {
      result += (str[i]);
      v = false;
    }
  }

  return result;
}

class searchListState extends State<searchList> {
  Widget appBarTitle = new Text(
    "Search Here",
    style: new TextStyle(color: Colors.black),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.black,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();

  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  searchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    _list = widget.litems.toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _IsSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact)).toList();
    } else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(
                    Icons.close,
                    color: Colors.black,
                  );
                  this.appBarTitle = new TextField(
                    controller: _searchQuery,
                    style: new TextStyle(
                      color: Colors.black,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.black),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.black)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.black,
      );
      this.appBarTitle = new Text(
        "Search Here",
        style: new TextStyle(color: Colors.black),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final List colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.orangeAccent
  ];
  final Random random = new Random();

  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
          subtitle: Text(
            "Paisa Dena Hai",
            style: TextStyle(
              color: Colors.black38,
            ),
          ),
          onTap: () {
            print("object");
          },
          trailing: Text(
            "₹ 500",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: CircleAvatar(
            child: Text(
              firstLetterWord(this.name).toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: colors[random.nextInt(colors.length)],
          ),
          title: new Text(this.name)),
      // decoration: new BoxDecoration(
      //     border: new Border(bottom: new BorderSide(color: Colors.black38))));
    );
  }
}
