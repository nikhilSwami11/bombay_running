import 'package:bombay_running/features/home/data/model/stock_model.dart';
import 'package:bombay_running/features/home/data/service/stock_service.dart';

class StockRepository {
  final StockService _stockService = StockService();

  Future<List<Stock>> getStockData() {
    return _stockService.getStockDataFromAPI();
  }
}
