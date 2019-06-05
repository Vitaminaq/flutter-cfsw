import 'package:intl/intl.dart';

/**
 * 转化为离现在多久 
 */
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
