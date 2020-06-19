import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  @override
  createState() => new CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          Text(
              '应该是点一下加一个数：'
          ),
          Text(
              '$_count'
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: new Icon(Icons.add),
          )
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }
}
