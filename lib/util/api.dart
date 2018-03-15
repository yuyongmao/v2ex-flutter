import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:v2ex/models/topic_item.dart';



class V2exApi {

  final v2ex_url = "https://www.v2ex.com";


  //正则表达式获取所需字段 xpath没有现成的库故放弃
  Future<List<TopicItem>> getTopicsByTabName(String tabName) async {

    String content = '';

    List<TopicItem> topics = new List<TopicItem>();

    final String reg4tag = "<div class=\"cell item\" style=\"\">(.*?)</table></div>";

    final String reg4MidAvatar = "<a href=\"/member/(.*?)\"><img src=\"(.*?)\" class=\"avatar\" ";

    final String reg4TRC = "<a href=\"/t/(.*?)#reply(.*?)\">(.*?)</a></span>";

    final String reg4NodeIdName = "<a class=\"node\" href=\"/go/(.*?)\">(.*?)</a>";

    final String reg4LastReply = "</strong> &nbsp;•&nbsp; (.*?) &nbsp;•&nbsp; 最后回复来自 <strong><a href=\"/member/(.*?)\">";

    var httpClient = new HttpClient();
    var uri = new Uri.http('www.v2ex.com', '/', {'tab': tabName});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();

    content = responseBody.replaceAll(new RegExp(r"[\r\n]|(?=\s+</?d)\s+"), '');

    RegExp exp = new RegExp(reg4tag);
    Iterable<Match> matches = exp.allMatches(content.toString());
    for (Match match in matches) {
      String regString = match.group(0);
      TopicItem item = new TopicItem();
      Match match4MidAvatar = new RegExp(reg4MidAvatar).firstMatch(regString);
      item.memberId=match4MidAvatar.group(1);
      item.avatar = match4MidAvatar.group(2);
      Match match4TRC = new RegExp(reg4TRC).firstMatch(regString);
      item.topicId = match4TRC.group(1);
      item.replyCount = match4TRC.group(2);
      item.topicContent = match4TRC.group(3);
      Match match4NodeIdName = new RegExp(reg4NodeIdName).firstMatch(regString);
      item.nodeId = match4NodeIdName.group(1);
      item.nodeName = match4NodeIdName.group(2);
      if(regString.contains("最后回复来自")) {
        Match match4LastReply = new RegExp(reg4LastReply).firstMatch(regString);
        item.lastestReplyTime = match4LastReply.group(1) ;
        item.lastestReplyMId = match4LastReply.group(2) ;
      }
      topics.add(item);
    }
    //print(topics.length);
    return topics;
  }
}
