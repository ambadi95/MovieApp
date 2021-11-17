import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function onChanged;
  final Function onEditingComplete;

  SearchBar({Key key, this.controller, this.onChanged, this.onEditingComplete})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  static const List<String> _movieList = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white12,
        child: TextField(
          controller: widget.controller,
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChanged,
          style: TextStyle(
              color: Colors.white38
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white38,
              ),
              hintText: 'Search Movies',
              hintStyle: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold
              )
          ),
        )
    );
  }
}
