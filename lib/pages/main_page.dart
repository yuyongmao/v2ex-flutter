import 'package:flutter/material.dart';
import 'package:v2ex/models/tab_data.dart';
import 'package:v2ex/components/drawer_meun.dart';

import 'package:v2ex/components/refresh_list_view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<TabData> tabs = <TabData>[
      new TabData(
        tabName: '技术',
        subWidget:new RefreshListView('tech')
      ),
      new TabData(
        tabName: '创意',
        subWidget: new RefreshListView('creative')
      ),
      new TabData(
        tabName: '好玩',
        subWidget:new RefreshListView('play')
        ),
      new TabData(
        tabName: 'Apple',
        subWidget: new RefreshListView('apple')
      ),
      new TabData(
        tabName: '酷工作',
        subWidget:new RefreshListView('jobs')
      ),
      new TabData(
        tabName: '交易',
        subWidget: new RefreshListView('deals')
      ),
      new TabData(
        tabName: '城市',
        subWidget: new RefreshListView('city')
      ),
      new TabData(
        tabName: '问与答',
        subWidget: new RefreshListView('qna')
      ),
      new TabData(
        tabName: '最热',
        subWidget:new RefreshListView('hot')
      ),
      new TabData(
        tabName: '全部',
        subWidget: new RefreshListView('all')
      ),
      new TabData(
        tabName: 'R2',
        subWidget: new RefreshListView('r2')
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
    return new RefreshListView(name);
  }
}
