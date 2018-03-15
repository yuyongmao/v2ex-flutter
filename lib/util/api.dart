import 'dart:io';
import 'dart:convert';
import 'package:html/dom.dart';
import 'package:html/parser.dart';


class V2exApi {
  final HttpClient httpClient = new HttpClient();

  //final String reg4tag = "<div class=\"cell item\" style=\"\">";
  final String reg4tag =
      "<div class=\"cell item\" style=\"\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">(<tr>(?:.*)</tr>)</table></div>";

  test() async {
    var uri = new Uri.http('www.v2ex.com', '/', {'tab': 'all'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    RegExp exp = new RegExp(reg4tag);
    Iterable<Match> matches = exp.allMatches(responseBody.toString());
    print(matches.length);
    for (Match match in matches) {
      print(match.group(0));
    }
  }

  test2() async {
    String content = '';
    final String reg4tag = "<div class=\"cell item\" style=\"\">(.*?)</table></div>";
    final String reg4username = "<a\\s+href=\"/member/(.*?)\">";
    final String reg4avatar = "<img src=\"//(.*?)\" ";
    final String reg4td3 = "<div class=\"cell item\" style=\"\">(.*?)</table></div>";
    final String reg4ta4 = "<div class=\"cell item\" style=\"\">(.*?)</table></div>";



    new HttpClient()
        .getUrl(Uri.parse('https://www.v2ex.com/?tab=all'))
        .then((HttpClientRequest request) => request.close())
        .then((HttpClientResponse response) {
      response.transform(new SystemEncoding().decoder).listen(
          (String requestText) {
        content = '$content$requestText';
      }, onDone: () {
        content = content.replaceAll(new RegExp(r"[\r\n]|(?=\s+</?d)\s+"), '');

        RegExp exp = new RegExp(reg4tag);
        Iterable<Match> matches = exp.allMatches(content.toString());

        for (Match match in matches) {
          Element tableElement = new Element.html(match.group(0)).children.first;
          Element trElement = tableElement.children.first.children.first;
          if(trElement.children.length==4){
            String td1String = trElement.children[0].outerHtml;
            RegExp exp1 = new RegExp(reg4avatar);
            Match match1 = exp1.firstMatch(td1String);
            print(match1.group(0)+'====='+match1.group(1));

            String td3String = trElement.children[2].outerHtml;

            String td4String = trElement.children[3].outerHtml;
          }
        }
      });
    });
  }
}
