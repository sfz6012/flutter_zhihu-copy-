import 'package:flutter/material.dart';
import 'index/index.dart';

void main() => runApp(new ZhiHu());

class ZhiHu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '知乎--仿制',
      home: new Index(),
    );
  }
}