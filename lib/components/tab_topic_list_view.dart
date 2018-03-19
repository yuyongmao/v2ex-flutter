import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v2ex/util/api.dart';
import 'dart:async';
import 'package:v2ex/models/tab_topic_item.dart';
import 'package:v2ex/components/tab_topic.dart';

class TabTopicListView extends StatefulWidget {

  final String tabId;

  TabTopicListView(this.tabId);

  @override
  State<StatefulWidget> createState() => new _TabTopicListView();
}

class _TabTopicListView extends State<TabTopicListView> {

  List<TabTopicItem> topics = [];

  @override
  void initState() {
    super.initState();
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    ListView listView = new ListView.builder(
        itemBuilder: itemBuilder, itemCount: topics.length);

    RefreshIndicator refreshIndicator =
        new RefreshIndicator(child: listView, onRefresh: onRefresh);

    return new NotificationListener(child: refreshIndicator);
  }

  Widget itemBuilder(BuildContext context, int index) {
    return new TabTopic(topics[index]);
  }

  Future onRefresh() async {
    List<TabTopicItem> fetchedTopics =
        await v2exApi.getTopicsByTabName(widget.tabId);
    if (mounted) {
      setState(() {
        this.topics.clear();
        this.topics.addAll(fetchedTopics);
      });
    }
  }
}
