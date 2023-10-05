import 'package:bombay_running/core/api/api_call_helper.dart';
import 'package:bombay_running/core/api/api_url.dart';
import 'package:bombay_running/features/home/data/model/stock_model.dart';
import 'package:dio/dio.dart';

class StockService {
  Future<List<Stock>> getStockDataFromAPI() async {
    final Response response =
        await ApiCallHelper.singleton.get(ApiUrl.bombayStockUrl);

    final List<Stock> stockList = [];
    for (var data in response.data as List) {
      stockList.add(Stock.fromJson(data));
    }
    return stockList;
  }
}
