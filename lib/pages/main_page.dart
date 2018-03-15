import 'package:flutter/material.dart';
import 'package:v2ex/models/tab_data.dart';
import 'package:v2ex/components/drawer_meun.dart';
import 'package:v2ex/util/api.dart';
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<TabData> tabs = <TabData>[
      new TabData(
        tabName: '技术',
        subWidget: _buildList('tech')
      ),
      new TabData(
        tabName: '创意',
        subWidget: _buildList('creative'),
      ),
      new TabData(
        tabName: '好玩',
        subWidget: _buildList('play'),
      ),
      new TabData(
        tabName: 'Apple',
        subWidget: _buildList('apple'),
      ),
      new TabData(
        tabName: '酷工作',
        subWidget: _buildList('jobs'),
      ),
      new TabData(
        tabName: '交易',
        subWidget: _buildList('deals'),
      ),
      new TabData(
        tabName: '城市',
        subWidget: _buildList('city'),
      ),
      new TabData(
        tabName: '问与答',
        subWidget: _buildList('qna'),
      ),
      new TabData(
        tabName: '最热',
        subWidget: _buildList('hot'),
      ),
      new TabData(
        tabName: '全部',
        subWidget: _buildList('all'),
      ),
      new TabData(
        tabName: 'R2',
        subWidget: _buildList('r2'),
      ),
    ];

    return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text('way to explore',
                  style: new TextStyle(fontFamily: 'Lobster')),
              bottom: new TabBar(
                  isScrollable: true,
                  tabs: tabs
                      .map((TabData data) => new Tab(text: data.tabName))
                      .toList()),
            ),
            body: new TabBarView(
                children: tabs.map((TabData data) {
              return new SafeArea(
                child: new Column(
                  children: <Widget>[new Expanded(child: data.subWidget)],
                ),
                top: false,
                bottom: false,
              );
            }).toList()),
            drawer: new DrawerMenu()));
  }

  Widget _buildList(String name) {
    return new ListView(
      children: <Widget>[
        new ListTile(
          title: new Text(name),
          onTap: ()=>new V2exApi().test2(),
        )
      ],
    );
  }
}
