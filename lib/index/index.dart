import 'package:flutter/material.dart';
import 'package:flutter_app4/NavigationIconView.dart';
import 'package:flutter_app4/home/home_page.dart';
import 'package:flutter_app4/idea/idea_page.dart';
import 'package:flutter_app4/market/market_page.dart';
import 'package:flutter_app4/notice/notice_page.dart';
import 'package:flutter_app4/mine/mine_page.dart';

class Index extends StatefulWidget {

  @override
  IndexState createState() {
    return new IndexState();
  }
}

class IndexState extends State<Index> with TickerProviderStateMixin {
  int currentIndex = 0;
  List<NavigationIconView> navigationIconViews;
  List<StatefulWidget> pageList;
  StatefulWidget currentPage;

  @override
  void initState() {
    super.initState();
    navigationIconViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assignment), title: new Text("首页"), vsync: this,),
      new NavigationIconView(icon: new Icon(Icons.all_inclusive),
        title: new Text("想法"),
        vsync: this,),
      new NavigationIconView(icon: new Icon(Icons.add_shopping_cart),
        title: new Text("市场"),
        vsync: this,),
      new NavigationIconView(
        icon: new Icon(Icons.add_alert), title: new Text("通知"), vsync: this,),
      new NavigationIconView(icon: new Icon(Icons.perm_identity),
        title: new Text("我的"),
        vsync: this,),
    ];
    for (NavigationIconView view in navigationIconViews) {
      view.controller.addListener(rebuild);
    }
    pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
      new NoticePage(),
      new MinePage()
    ];
    currentPage = pageList[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: navigationIconViews.map((NavigationIconView view) => view.item)
          .toList(),
      currentIndex: currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          navigationIconViews[currentIndex].controller.reverse();
          currentIndex = index;
          navigationIconViews[currentIndex].controller.forward();
          currentPage = pageList[currentIndex];
        });
      },
    );
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
            child: currentPage
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  void rebuild() {
    setState(() {});
  }
}