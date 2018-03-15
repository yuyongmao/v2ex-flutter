import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v2ex/util/functions.dart';
import 'package:v2ex/util/api.dart';
import 'dart:async';
import 'package:v2ex/models/topic_item.dart';
import 'package:v2ex/components/topic.dart';
class RefreshListView extends StatefulWidget{

  final String tabId;


  RefreshListView( this.tabId);

  @override
  State<StatefulWidget> createState() => new _RefreshListViewState();

}


class _RefreshListViewState extends State<RefreshListView>{

  List<TopicItem> topics = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
   
    ListView listView = new ListView.builder(itemBuilder: itemBuilder,itemCount: topics.length);

    RefreshIndicator refreshIndicator = new RefreshIndicator(child: listView, onRefresh: onRefresh);

    return new NotificationListener(child: refreshIndicator);
  }


  Widget itemBuilder(BuildContext context,int index){
    return new Topic(topics[index]);
  }

  Future onRefresh() async{
    List<TopicItem> fetchedTopics = await new V2exApi().getTopicsByTabName(widget.tabId);
    setState((){
      this.topics.clear();
      this.topics.addAll(fetchedTopics);
    });
  }
}