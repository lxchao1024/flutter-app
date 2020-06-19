import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  var datas;

  @override
  void initState() {
    getHomeBanner().then((value) {
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 200.0,
        child: Swiper(
          itemCount: 3,
          itemBuilder: _swiperBuilder,
          autoplay: true,
          //是否显示分页按钮
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          pagination: new SwiperPagination(
            builder: new DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white
            )
          ),
        ),
      )],
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Image.network('http://via.placeholder.com/350x150', fit: BoxFit.fill);
  }
}
