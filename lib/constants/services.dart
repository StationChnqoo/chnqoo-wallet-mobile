import 'dart:convert';

import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:chnqoo_wallet/constants/bond_forward.dart';
import 'package:chnqoo_wallet/constants/fund_tiantian.dart';
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
    List<String> couldPrintUrls = [];
    // x.usePrint('CurlBuilder', curlCommand);
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
    // x.usePrint('CurlBuilder', response.data);
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

  queryFundsBasic(List<String> codes) async {
    dio.options.baseUrl = 'https://fundcomapi.tiantianfunds.com';
    int pageSize = 10; // 每页的大小
    List<FundTiantian> list = [];
    // 计算总页数
    int totalPages = (codes.length / pageSize).ceil();
    // 模拟分页请求
    for (int page = 0; page < totalPages; page++) {
      int start = page * pageSize;
      int end = (page + 1) * pageSize;
      if (end > codes.length) {
        end = codes.length;
      }
      List<String> subCodes = codes.sublist(start, end);
      /** 接口限制，最多只能查30个 */
      Response response = await dio.post('/mm/newCore/FundCoreDiyNew',
          queryParameters: Map.of({
            'FCODES': subCodes.join(','),
            'FIELDS':
                'SHORTNAME,RZDF,DWJZ,LJJZ,SYL_1N,SYL_LN,FSRQ,ISBUY,DTZT,FTYPE,FCODE,ISSALES,ISSBDATE,ISSEDATE,TSRQ,BACKCODE,MINSG,MINSBSG,SHZT,SGZT,SOURCERATE,RATE,REALSGCODE,FEATURE,SYL,MINRG,SYL_Z,BFUNDTYPE,QDTCODE,MINDT,BAGTYPE,FUNDTYPE,BENCH,ESTABDATE,,SELLSTATE,ESTDIFF,SYSDATE,PTYPE,FUNDTYPE,ISEXCHG,ISNEW,BTYPE'
          }));
      var data = response.data['data'] as List;
      List<FundTiantian> tiantianFunds = data
          .map<FundTiantian>((json) => FundTiantian.fromJson(json))
          .toList();
      list = [...list, ...tiantianFunds];
    }
    return list;
  }

  /**
   * 期货价格
   * 8: 30年债券
   * 4: 10年债券
   * 5: 5年债券
   * 6: 2年债券
   */
  queryBondForwardPrices(int code) async {
    dio.options.baseUrl = 'https://futsseapi.eastmoney.com';
    Response response = await dio.get(
        '/list/variety/220/${code}?orderBy=zdf&sort=desc&pageSize=10&pageIndex=0&field=zdf,sc,dm,name,p,zde,vol,ccl,zjsj&callbackName=');
    String data = response.data.toString();
    dynamic result = jsonDecode(data.substring(1, data.length - 1));
    List<dynamic> list = result['list'];
    List<BondForward> bfs =
        list.map<BondForward>((e) => BondForward.fromJson(e)).toList();
    return bfs;
  }

  queryFundName(String code) async {
    dio.options.baseUrl = 'https://fund.eastmoney.com';
    Response response = await dio.get('/${code}.html');
    var data = response.data;
    BeautifulSoup bs = BeautifulSoup(data.toString());
    var span = bs.find('span', class_: 'funCur-FundName');
    return span?.text ?? '';
  }

  queryStock(String code) async {
    dio.options.baseUrl = 'https://push2.eastmoney.com';
    /**
     * 目前爬虫发现的
     * 159开头的，请求参数`secid=` -> 0.xxx
     * 511开头的，请求参数为 ... -> 1.xxx
     */
    String codePrefix = code.startsWith('159')
        ? '0.'
        : code.startsWith('511')
            ? '1.'
            : '';
    Response response = await dio.get(
        // '/api/qt/stock/get?invt=2&fltt=1&cb=&fields=f58%2Cf734%2Cf107%2Cf57%2Cf43%2Cf59%2Cf169%2Cf170%2Cf152%2Cf46%2Cf60%2Cf44%2Cf45%2Cf47%2Cf48%2Cf19%2Cf17%2Cf531%2Cf15%2Cf13%2Cf11%2Cf20%2Cf18%2Cf16%2Cf14%2Cf12%2Cf39%2Cf37%2Cf35%2Cf33%2Cf31%2Cf40%2Cf38%2Cf36%2Cf34%2Cf32%2Cf211%2Cf212%2Cf213%2Cf214%2Cf215%2Cf210%2Cf209%2Cf208%2Cf207%2Cf206%2Cf161%2Cf49%2Cf171%2Cf50%2Cf86%2Cf168%2Cf108%2Cf167%2Cf71%2Cf292%2Cf51%2Cf52%2Cf191%2Cf192%2Cf452%2Cf177&secid=1.${code}'
        '/api/qt/stock/get?cb=&fields=f57%2Cf58%2Cf59%2Cf152%2Cf43%2Cf169%2Cf170%2Cf60%2Cf44%2Cf45%2Cf168%2Cf50%2Cf47%2Cf48%2Cf49%2Cf46%2Cf78%2Cf85%2Cf86%2Cf169%2Cf117%2Cf107%2Cf111%2Cf116%2Cf117%2Cf118%2Cf163%2Cf171%2Cf113%2Cf114%2Cf115%2Cf161%2Cf162%2Cf164%2Cf168%2Cf172%2Cf177%2Cf180%2Cf181%2Cf292%2Cf751%2Cf752&secid=${codePrefix}${code}&invt=2');
    dio.options.headers = {
      // 'host': 'api.fund.eastmoney.com',
      'referer': 'https://so.eastmoney.com/web/s?keyword=${code}',
      // 'content-Type': 'application/json',
    };
    return response.data;
  }

  queryTodayBonds() async {
    // https://fund.eastmoney.com
    // https://fund.eastmoney.com/data/rankhandler.aspx?op=ph&dt=kf&ft=zq&rs=&gs=0&sc=1nzf&st=asc&sd=2023-04-23&ed=2024-04-23&qdii=|&tabSubtype=,,,,,&pi=1&pn=10000&dx=1
    List<String> list = [];
    dio.options.baseUrl = 'https://fund.eastmoney.com';
    dio.options.headers = {
      'referer': 'https://fund.eastmoney.com/data/fundranking.html'
    };
    Response response = await dio.get(
      '/data/rankhandler.aspx?op=ph&dt=kf&ft=zq&rs=&gs=0&sc=1nzf&st=asc&qdii=|&tabSubtype=,,,,,&pi=1&pn=9999&dx=1',
    );
    RegExp regExp = RegExp(r'datas:\s*\[(.*?)\]');
    Match? match = regExp.firstMatch(response.data);
    if (match != null) {
      String text = '[${match.group(1)!}]';
      List<dynamic> decoder = jsonDecode(text);
      list = decoder.cast<String>();
    }
    return list;
  }

  queryStocksCount() async {
    dio.options.baseUrl = 'https://push2.eastmoney.com';
    dio.options.headers = {
      'referer': 'https://data.eastmoney.com/zjlx/dpzjlx.html'
    };
    Response response = await dio.get(
      '/api/qt/ulist.np/get?cb=&fltt=2&secids=1.000001%2C0.399001&fields=f1%2Cf2%2Cf3%2Cf4%2Cf6%2Cf12%2Cf13%2Cf104%2Cf105%2Cf106',
    );
    return response.data;
  }
}
