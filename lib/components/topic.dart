import 'package:flutter/material.dart';
import 'package:v2ex/models/topic_item.dart';
class Topic extends StatelessWidget{
  final TopicItem topicItem;

  Topic(this.topicItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Container container = new Container(
      child: new Column(
        children: <Widget>[
          new Text(topicItem.topicContent)
        ],
      ),
    );
    return new Card(child: container,color: Colors.white);
  }
}