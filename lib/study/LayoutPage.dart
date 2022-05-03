import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/TestBean.dart';
import 'package:flutter_wanandroid/bean/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LayoutPageState();
  }
}

class LayoutPageState extends State<LayoutPage> {
  //标题部分的布局
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            )
          ],
        )),
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const Text("41")
      ],
    ),
  );

  //构建一个按钮和文本
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: color,
                  )))
        ]);
  }

  Widget textSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("布局学习")),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: 600,
              height: 240,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/lake.jpg"),
                      fit: BoxFit.contain))),
          titleSection,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(
                  Theme.of(context).primaryColor, Icons.call, "CALL"),
              _buildButtonColumn(
                  Theme.of(context).primaryColor, Icons.near_me, "ROUTE"),
              _buildButtonColumn(
                  Theme.of(context).primaryColor, Icons.share, "SHARE"),
            ],
          ),
          textSection,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                child: const Text("序列化json"),
                onPressed: () {
                  String jsonStr =
                      '''{"name":"张三","email":"766790183@qq.com","age":98}''';
                  print('-----------> 开始=$jsonStr');

                  //解析json为User对象
                  Map<String, dynamic> userMap = jsonDecode(jsonStr);
                  var user = User.fromJson(userMap);
                  print("反序列化结果=name=${user.name} age=${user.age} email=${user.email}");
                  var json = jsonEncode(user);
                  print('序列化结果：$json');
                },
              ),
              ElevatedButton(
                child: const Text("序列化接续嵌套json"),
                onPressed: () {
                  String jsonStr = testBeanJson;
                  //解析json为User对象
                  Map<String, dynamic> testBeanMap = jsonDecode(jsonStr);
                  TestBean testBean = TestBean.fromJson(testBeanMap);
                  print("反序列化结果=${testBean.name},${testBean.address?.content}");
                  var json = jsonEncode(testBean);
                  print('序列化结果：$json');
                },
              )
            ],
          )
        ],
      ),
    );
  }

  String testBeanJson = '''
  {
    "name":"张三",
    "email":"766790183@qq.com",
    "age":98,
    "address":{
        "code":"777",
        "content":"深圳市宝安区"
    }
}
  ''';
}
