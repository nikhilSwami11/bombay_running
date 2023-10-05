part of 'stock_details_cubit.dart';

sealed class StockDetailsState extends Equatable {
  const StockDetailsState();

  @override
  List<Object> get props => [];
}

final class StockDetailsInitial extends StockDetailsState {}

final class StockDetailsLoading extends StockDetailsState {}

final class StockDetailsError extends StockDetailsState {}

final class StockDetailsData extends StockDetailsState {
  final List<Stock> stocks;

  const StockDetailsData({
    required this.stocks,
  });

  @override
  List<Object> get props => [stocks];
}
