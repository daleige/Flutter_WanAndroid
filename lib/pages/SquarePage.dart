import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/bean/response/AquareListBean.dart';
import 'package:flutter_wanandroid/constants/ApiService.dart';
import 'package:flutter_wanandroid/http/Singleton.dart';

class SquarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SquarePageState();
  }
}

class SquarePageState extends State<SquarePage> {
  var itemCount = 0;
  List<Datas> list = [];

  SquarePageState() {
    _onRefresh;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: _renderRow,
          itemCount: list.length,
        ),
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    Datas data = list[index];
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.shareUser ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  data.title ?? "",
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  data.superChapterName ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )),
        Expanded(
            flex: 2,
            child: SizedBox(
                width: 100,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        data.niceShareDate ?? "",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Container(
                    alignment:Alignment.center,
                      child: const Icon(
                        Icons.favorite_border,
                        color: null,
                      ),
                    )
                  ],
                )))
      ],
    );
  }

  ///获取广场列表数据
  Future<void> _onRefresh() async {
    var response = await Singleton.getDio().request(ApiService.AQUARE_LIST,
        data: {'page_size': 3}, options: Options(method: "GET"));
    Map<String, dynamic> userMap = jsonDecode(response.toString());
    SquareListBean squareListResponse = SquareListBean.fromJson(userMap);
    if (squareListResponse.errorCode == 0) {
      squareListResponse.data?.datas?.forEach((element) {
        list.add(element);
      });
      setState(() {});
    }
    return;
  }
}
