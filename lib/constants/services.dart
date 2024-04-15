import 'package:chnqoo_wallet/constants/x.dart';
import 'package:dio/dio.dart';

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

  selectBingWallPaper() async {
    var result = await Dio().get(
        'https://mouday.github.io/wallpaper-database/${x.usePreviousDay(1)}.json');
    return result;
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
    DateTime now = DateTime.now();
    int milliseconds = now.millisecondsSinceEpoch;
    dio.options.baseUrl = 'https://bond.eastmoney.com';
    Response response = await dio.get('');
    return response.data;
  }
}
