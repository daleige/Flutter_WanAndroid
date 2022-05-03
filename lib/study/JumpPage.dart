import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/study/AutoAdapterPage.dart';
import 'package:flutter_wanandroid/study/LayoutPage.dart';

class JumpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JumpPageState();
  }
}

class JumpPageState extends State<JumpPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("页面跳转")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _jumpToPage(1);
                },
                child: const Text("布局学习"),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _jumpToPage(2);
                  },
                  child: const Text("Gson序列化"),
                )),
            Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _jumpToPage(3);
                  },
                  child: const Text("屏幕适配"),
                )),
          ],
        ));
  }

  void _jumpToPage(int i) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          Widget widget = const LayoutPage();
          switch (i) {
            case 1:
              widget = LayoutPage();
              break;
            case 2:
              widget = AutoAdapterPage();
              break;
            case 3:
              widget = AutoAdapterPage();
              break;
          }
          return widget;
        },
      ),
    );
  }
}
