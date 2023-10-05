part of 'edit_stocks_cubit.dart';

sealed class EditStocksState extends Equatable {
  const EditStocksState();

  @override
  List<Object> get props => [];
}

final class EditStocksData extends EditStocksState {
  final int currentIndex;

  const EditStocksData(this.currentIndex);
  @override
  List<Object> get props => [currentIndex];
}
