import 'package:chnqoo_wallet/constants/x.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

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

  selectTest() async {
    var result = await dio.get('/test');
    return result;
  }

  sendSms(String mobile) async {
    var result = await dio.get('/sendSms.do',
        queryParameters: Map.from({"mobile": mobile}));
    return result.data;
  }

  checkSms(String mobile, String code) async {
    var result = await dio.get("/checkSms.do",
        queryParameters: Map.from({"mobile": mobile, "code": code}));
    return result.data;
  }

  upload(String id, String idQoo, String file) async {
    String fileName = file.split('/').last;

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file,
        filename: fileName,
        contentType: MediaType.parse(lookupMimeType(file) ?? ""),
      ),
      "id": id,
      "idQoo": idQoo
    });
    var result = await dio.post('/fileUploader.do', data: formData);
    return result.data;
  }
}
