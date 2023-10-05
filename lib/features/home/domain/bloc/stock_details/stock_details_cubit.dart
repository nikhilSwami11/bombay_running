import 'package:bombay_running/features/home/data/model/stock_model.dart';
import 'package:bombay_running/features/home/data/model/variable_model.dart';
import 'package:bombay_running/features/home/domain/repository/stock_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'stock_details_state.dart';

class StockDetailsCubit extends Cubit<StockDetailsState> {
  StockDetailsCubit() : super(StockDetailsLoading());

  List<Stock> stockDataList = [];
  Future<void> getStockDetails() async {
    emit(StockDetailsLoading());
    try {
      StockRepository stockRepository = StockRepository();
      stockDataList = await stockRepository.getStockData();
      emit(StockDetailsData(stocks: stockDataList));
    } catch (e, _) {
      emit(StockDetailsError());
    }
  }

  Future<void> saveEditedValues(
    Variable variable,
    String variableKey,
    int stockIndex,
    int criteriaIndex,
  ) async {
    emit(StockDetailsLoading());
    stockDataList[stockIndex]
        .criteria![criteriaIndex]
        .variableProperties?[variableKey] = variable;

    emit(StockDetailsData(stocks: stockDataList));
  }
}
