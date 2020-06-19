import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'RandomListView.dart';
import 'InitAppCode.dart';
import 'example/MainView.dart';

//初始化项目生成的代码块
//void main() => runApp(MyApp());

//自己定义的代码块
void main() => runApp(MainView());

//Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Welcome to Flutter"),
          centerTitle: true,
        ),
//        body: new Column(
//          children: <Widget>[new Text('Hello World')],
//        ),
      body: new Center(
        //直接定义显示内容的控件
//        child: new Text('Hello world ' + wordPair.asPascalCase),
        //当前文件定义显示内容的控件
//        child: new StatefulApp(),
        //引用别的文件下的控件
        child: new RandomListView(),
      ),
      ),
    );
  }
}

//Stateful widgets 持有的状态可能在 widget 生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:
//1.一个 StatefulWidget 类。
//2.一个 State 类。 StatefulWidget 类本身是不变的，但是 State 类在 widget 生命周期 中始终存在.
class StatefulApp extends StatefulWidget {

  @override
  createState() => new StatefulAppState();
}

class StatefulAppState extends State<StatefulApp>{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text('Stateful widget random word: ' + wordPair.asPascalCase);
  }
}

//自定义列表
class RandomListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      //配置程序主题为白色
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home: new RandomListView(),
    );
  }
}
