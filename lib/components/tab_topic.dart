import 'package:flutter/material.dart';
import 'package:v2ex/models/tab_topic_item.dart';

import 'package:v2ex/util/api.dart';
import 'package:flutter/services.dart';


class TabTopic extends StatelessWidget {
  final TabTopicItem topicItem;

  TabTopic(this.topicItem);

  @override
  Widget build(BuildContext context) {
    Container container = new Container(
      padding: const EdgeInsets.all(5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.network(topicItem.avatar, width: 48.0, height: 48.0),
              new Padding(padding: new EdgeInsets.only(right: 10.0)),
              new Expanded(
                flex: 1,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          child: new Text(
                            topicItem.memberId,
                            style: new TextStyle(fontSize: 14.0),
                          ),
                        ),
                        new Container(
                          child: new Text(
                            topicItem.nodeName,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0),
                          ),
                          padding: const EdgeInsets.all(2.0),
                          decoration: new BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: new BorderRadius.circular(4.0),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                        ),
                        new Icon(
                          Icons.mode_comment,
                          color: Theme.of(context).primaryColor,
                          size: 14.0,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                        ),
                        new Text(
                          topicItem.replyCount,
                          style: new TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 13.0),
                        ),
                      ],
                    ),
                    new Text(
                      topicItem.lastestReplyTime == ''
                          ? '暂无评论'
                          : '${topicItem.lastestReplyTime} • 最后回复 ${topicItem.lastestReplyMId}',
                      style: new TextStyle(color: Colors.grey, fontSize: 13.0),
                    )
                  ],
                ),
              )
            ],
          ),
          new Padding(padding: const EdgeInsets.only(top: 5.0)),
          new Text(topicItem.topicContent,style: new TextStyle(fontSize: 15.0),)
        ],
      ),
    );
    return new Card(
        child: new InkWell(
          child: container,
          onTap: ()=>UrlLauncher.launch('https://www.baidu.com'),
        ),
        color: Colors.white);
  }
}
