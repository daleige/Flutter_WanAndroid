import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/IndexPage.dart';
import 'package:flutter_wanandroid/pages/SquarePage.dart';
import 'package:flutter_wanandroid/study/JumpPage.dart';
import 'package:flutter_wanandroid/study/RandomWordsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: const MyHomePage(title: '玩Android'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectIndex = 0;
  int _currentPageIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation',
            onPressed: () => debugPrint('Navigation button is pressed.'),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => _search(),
            ),
          ],
        ),
        body: PageView.builder(
            onPageChanged: _pageChange,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return const IndexPage();
              } else if (index == 1) {
                return  SquarePage();
              } else if (index == 2) {
                return const Text("我是第3页");
              } else if (index == 3) {
                return const Text("我是第4页");
              } else {
                return const Text("我是第5页");
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: _scrollUpward,
          tooltip: 'arrow_upward',
          child: const Icon(Icons.arrow_upward),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectIndex,
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public_rounded),
              label: '广场',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wechat),
              label: '公众号',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: '体系',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_special),
              label: '项目',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
            });
          },
        ));
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
      if (_currentPageIndex != _selectIndex) {
        _selectIndex = _currentPageIndex;
      }
    });
  }

  void _search() {
    Fluttertoast.showToast(
      msg: "点击搜索",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JumpPage()),
    );
  }

  void _scrollUpward() {
    setState(() {
      _counter++;
    });
  }
}
