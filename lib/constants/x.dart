import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class x {
  static useCDN(String url, int width) {
    return '${url}?x-oss-process=image/resize,w_${width * 2}';
  }

  static Color useRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static usePreviousDay(int days) {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: days));
    String formattedDate =
        "${yesterday.year}/${yesterday.month.toString().padLeft(2, '0')}/${yesterday.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }

  static useGreyImageFilter() {
    return [
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
  }

  static List<String> useWechatEmojis() {
    return [
      '666666.png',
      '福.png',
      '再见.png',
      '发呆.png',
      '发财.png',
      '口罩.png',
      '可爱.png',
      '叹气.png',
      '吃瓜.png',
      '唏嘘.png',
      '嘿哈.png',
      '奋斗.png',
      '好的.png',
      '惆怅.png',
      '惊恐.png',
      '感谢.png',
      '打脸.png',
      '抱拳.png',
      '捂脸.png',
      '旺财.png',
      '机智.png',
      '流汗.png',
      '滑稽.png',
      '烟花.png',
      '白眼.png',
      '皱眉.png',
      '礼物.png',
      '社会.png',
      '祝贺.png',
      '红包.png',
      '苦涩.png',
      '苦笑.png',
      '蜡烛.png',
      '裂开.png',
      '震惊.png',
      '高兴.png',
      '冒冷汗.png',
      '斜眼看.png',
      '眼前一亮.png',
      '让我看看.png',
    ];
  }

  static isNull(dynamic s) {
    return s == Null || s == null || s.isEmpty || s.trim().isEmpty;
  }

  static useDeepClone(dynamic object) {
    return json.decode(json.decode(object));
  }

  static useAddress2String(dynamic address) {
    List datas =
        [address['province'], address['city'], address['area']].toList();
    return datas
        .map((e) {
          return e == null ? '' : e['name'];
        })
        .toList()
        .join('');
  }

  static usePrint(String title, dynamic message) {
    String? fileName;
    int? lineNumber;
    // print(stackTrace.toString());
    // if (stackTrace != null) {
    //   fileName =
    //       stackTrace.toString().split("\n")[1].split("(")[1].split(")")[0];
    //   lineNumber =
    //       int.parse(stackTrace.toString().split("\n")[1].split(":")[1]);
    // }
    print("");
    print('Console -> ${useCurrentTime()}');
    print('${title}');
    print('${message}');
    print('Console -> ${useCurrentTime()}');
    print("");
  }

  static useDocumentPath() async {
    String dir = "./";
    if (GetPlatform.isWeb) {
    } else {
      var folder = await getApplicationDocumentsDirectory();
      dir = folder.path;
    }
    return dir;
  }

  static checkPhotoPermission() async {
    bool result = false;
    if (Platform.isAndroid) {
      // Only check for storage < Android 13
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        bool video = await Permission.videos.status.isGranted;
        bool photo = await Permission.photos.status.isGranted;
        result = video && photo;
      } else {
        result = await Permission.storage.status.isGranted;
      }
    } else if (Platform.isIOS) {
      result = await Permission.photos.isGranted ||
          await Permission.photos.isLimited;
    }
    return result;
  }

  static String useMD5(String s) {
    return md5.convert(utf8.encode('Chnqoo@t:${s}')).toString();
  }

  static bool isMobile(String s) {
    return RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(s);
  }

  static useAorB(dynamic a, dynamic b) {
    return a == Null || a == null || a == "" ? b : a;
  }

  static useCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  }

  static useDiffDate(int diff) {
    DateTime now = DateTime.now();
    DateTime time = now.add(Duration(days: diff));
    return DateFormat('yyyy-MM-dd').format(time);
  }

  static useDate() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  static toast(String title, String message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
      ), // Title
      messageText: Text(
        message,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ), // Ti,// Message
      snackPosition: SnackPosition.BOTTOM, // Position
      backgroundColor: Colors.black87.withOpacity(0.8), // Background color
      colorText: Colors.white, // Text color
      borderRadius: 10.0, // Border radius
      margin: EdgeInsets.all(10.0), // Margin around the toast
      duration: Duration(seconds: 2), // Duration
    );
  }
}
