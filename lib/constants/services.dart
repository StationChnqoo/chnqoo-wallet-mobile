import 'dart:convert';

import 'package:chnqoo_wallet/constants/x.dart';
import 'package:dio/dio.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:intl/intl.dart';

// Dio在原有返回的结构上包了一层data -> {data: {success: bool, data: map}}

class CurlBuilder extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    String curlCommand = 'curl --location \'${options.uri.toString()}\'';

    options.headers.forEach((key, value) {
      curlCommand += ' --header \'$key: $value\'';
    });

    if (options.data != null) {
      curlCommand += " --data '${options.data}'";
    }
    x.usePrint('CurlBuilder', curlCommand);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
    x.usePrint('CurlBuilder', response.data);
  }
}

class Services {
  Dio dio = Dio();
  // Services() : dio = Dio();
  Services() {
    int milliseconds = DateTime.now().millisecondsSinceEpoch;
    dio.options = BaseOptions(
        sendTimeout: Duration(seconds: 10),
        connectTimeout: Duration(seconds: 10),
        // http://192.168.0.102:21981/api/chnqoo-notebook
        // http://192.168.0.102:21981
        baseUrl: 'http://192.168.0.104:21981',
        // baseUrl: Config.SERVER,
        headers: Map.from(
            {'t': milliseconds, 's': x.useMD5(milliseconds.toString())}));

    dio.interceptors.add(CurlBuilder());
  }

  selectBingWallPaper(int days) async {
    Response response = await Dio().get(
        'https://mouday.github.io/wallpaper-database/${x.usePreviousDay(days)}.json');
    return response.data;
  }

  selectEastMoneyBonds() async {
    DateTime now = DateTime.now();
    int milliseconds = now.millisecondsSinceEpoch;
    dio.options.baseUrl = 'https://97.push2delay.eastmoney.com';
    Response response = await dio.get(
        '/api/qt/clist/get?pn=1&pz=20&po=1&np=1&ut=bd1d9ddb04089700cf9c27f6f7426281&fltt=2&invt=2&wbp2u=|0|0|0|web&fid=f3&fs=i:1.000012,i:1.000013,i:1.000022,i:1.000061,i:0.395021,i:0.395022,i:0.395031,i:0.395032,i:0.399481&fields=f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f13,f14,f15,f16,f17,f18,f20,f21,f23,f24,f25,f26,f22,f33,f11,f62,f128,f136,f115,f152&_=${milliseconds}');
    return response.data;
  }

  selectEastMoneyBondsNews() async {
    dio.options.baseUrl = 'https://bond.eastmoney.com';
    Response response = await dio.get('');
    return response.data;
  }

  selectZhishubao() async {
    dio.options.baseUrl = 'https://zhishubao.1234567.com.cn';
    Response response = await dio.post('/home/AllIndex',
        queryParameters: Map.from({'dateType': 'D'}));
    return response.data;
  }

  selectBondPrice(String id, String startDate, String endDate) async {
    dio.options.baseUrl = 'https://api.fund.eastmoney.com';
    dio.options.headers = {
      'host': 'api.fund.eastmoney.com',
      'referer': 'https://fundf10.eastmoney.com/',
      'content-Type': 'application/json',
    };
    DateTime now = DateTime.now();
    int milliseconds = now.millisecondsSinceEpoch;
    Response response = await dio.get(
      '/f10/lsjz?callback=&fundCode=${id}&pageIndex=1&pageSize=365&startDate=${startDate}&endDate=${endDate}&_=${milliseconds}',
    );
    return response.data;
  }

  queryFundName(String code) async {
    dio.options.baseUrl = 'https://fund.eastmoney.com';
    Response response = await dio.get('/${code}.html');
    var data = response.data;
    BeautifulSoup bs = BeautifulSoup(data.toString());
    var span = bs.find('span', class_: 'funCur-FundName');
    return span?.text ?? '';
  }

  queryTodayBonds(String date) async {
    // https://fund.eastmoney.com
    // https://fund.eastmoney.com/data/rankhandler.aspx?op=ph&dt=kf&ft=zq&rs=&gs=0&sc=1nzf&st=asc&sd=2023-04-23&ed=2024-04-23&qdii=|&tabSubtype=,,,,,&pi=1&pn=10000&dx=1
    int start = DateTime.now().millisecondsSinceEpoch;
    List<String> list = [];
    dio.options.baseUrl = 'https://fund.eastmoney.com';
    dio.options.headers = {
      'referer': 'https://fund.eastmoney.com/data/fundranking.html'
    };
    Response response = await dio.get(
      '/data/rankhandler.aspx?op=ph&dt=kf&ft=zq&rs=&gs=0&sc=1nzf&st=asc&sd=${date}&ed=${date}&qdii=|&tabSubtype=,,,,,&pi=1&pn=9999&dx=1',
    );
    RegExp regExp = RegExp(r'datas:\s*\[(.*?)\]');
    Match? match = regExp.firstMatch(response.data);
    if (match != null) {
      String text = '[${match.group(1)!}]';
      List<dynamic> decoder = jsonDecode(text);
      list = decoder.cast<String>();
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    print('🐔 list: ${list.length}.');
    print('⏰ time: ${end - start}ms.');
    return list;
  }
}