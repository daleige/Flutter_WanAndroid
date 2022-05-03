import 'package:flutter/material.dart';

class AutoAdapterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AutoAdapterState();
  }
}

class AutoAdapterState extends State<AutoAdapterPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(width: 300, height: 100, color: Colors.red),
        Container(width: 350, height: 100, color: Colors.blue),
        Container(width: 360, height: 100, color: Colors.green)
      ],
    );
  }
}
