import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  /** Command variables */
  static const String APP_PACKAGE_NAME =
      String.fromEnvironment('APP_PACKAGE_NAME');
  static const String APP_NAME = String.fromEnvironment('APP_NAME');

  /** Dotenv */
  static String ENV = dotenv.get('ENV');
  static String CDN = dotenv.get('CDN');
  static String SERVER = dotenv.get('SERVER');

  /** UI */
  static double PAGE_PADDING = 15;
  static Color PAGE_BACKGROUND = Color.fromARGB(0, 244, 234, 203);
  static String ME = '@花式养鸡总冠军';

  /** 映射Config文件 */
  static String useConfigDotenvFile(String package) {
    const map = {
      'net.cctv3.wallet': ".env.production",
      "net.cctv3.wallet.uat": ".env.alpha",
      "net.cctv3.wallet.sit": ".env.staging",
      "net.cctv3.wallet.dev": ".env.development"
    };
    return map[package] ?? '.env.development';
  }
}
