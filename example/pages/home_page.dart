import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController typeController = new TextEditingController();
  String showText = '欢迎你来到美好人间';

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1000,
      child: Column(
        children: <Widget>[
          TextField(
            controller: typeController,
            autofocus: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: '美女类型',
                helperText: '请输入你喜欢的类型'),
          ),
          RaisedButton(
            child: new Text('选择完毕'),
            onPressed: _choiceAction,
          ),
          Text(
            showText,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }

  void _choiceAction() async {
    print('开始选择你喜欢的类型............');
    if (typeController.text.toString() == '') {
      _showNormalDialog();
    } else {
      _showCupertino();
      try {
        Response response = await Dio().get('http://www.baidu.com');
        print(response);
        setState(() {
          showText = '哇哦哇哦，' + typeController.text.toString() + '真真是极好的';
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void _showNormalDialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text('data'),
          content: Text('content'),
          backgroundColor: Colors.white,
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: <Widget>[
            FlatButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  //仿iOS风格弹出框样式
  void _showCupertino() {
    showDialog(
        context: context,
        child: new CupertinoAlertDialog(
          content: new SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('IOS风格', style: TextStyle(fontSize: 18.0)),
                Text('是否要删除？'),
                Text('一旦删除数据不可恢复！')
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
