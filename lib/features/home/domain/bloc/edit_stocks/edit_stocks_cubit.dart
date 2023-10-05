import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_stocks_state.dart';

class EditStocksCubit extends Cubit<EditStocksState> {
  EditStocksCubit({required int index}) : super(EditStocksData(index));

  void toggleSelectedValue(int selectedIndex) {
    emit(EditStocksData(selectedIndex));
  }
}
