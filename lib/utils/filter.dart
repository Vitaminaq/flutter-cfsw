import 'package:intl/intl.dart';
import 'package:flutterdemo/model/chatroom.dart';

// 转化为离现在多久
final Function time = (String str) {
  if (str == null) return '--';
  int timestamp = int.parse(str);
  var now = DateTime.now();
  var format = new DateFormat('yyyy-MM-dd H:m');
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    // 当天
    if (diff.inSeconds < 1) {
      time = '刚刚';
    }
    if (diff.inSeconds < 60) {
      time = diff.inSeconds.toString() + "秒前";
    }
    if (diff.inHours > 1 && diff.inHours < 24) {
      time = diff.inHours.toString() + '时前';
    }
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    // 本周内
    time = diff.inDays.toString() + '天前';
  } else {
    time = format.format(date);
  }
  return time;
};

class ArticReg {
  List<String> images = [];
  String text = '';

  ArticReg({this.images, this.text});
}

///
/// 解析富文本内容，得到纯文本，和图片
///
ArticReg Function(List<SortedContent>) formatContent =
    (List<SortedContent> sorted_content) {
  if (sorted_content == null || sorted_content.length == 0)
    return ArticReg(images: [], text: '');
  final String str = sorted_content[0].text;
  final RegExp imgReg = RegExp(r"(https|http).*?(?:jpg|png|jpeg|gif)");
  final List<String> images = [];
  final Iterable<RegExpMatch> matches = imgReg.allMatches(str);
  for (Match m in matches) {
    images.add(m.group(0));
  }
  final String relS = str.replaceAll(RegExp(r"<[^>]+>"), '');
  return ArticReg(images: images, text: relS);
};

// 与h5交互的一些常量
final String h5App = '__app_vue__';
final String h5Callback = '__app_wismo_callback__';

// 校验手机号
bool Function(String) isPhone = (String str) {
  return new RegExp(
          '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
      .hasMatch(str);
};
