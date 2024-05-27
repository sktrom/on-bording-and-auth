import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_pagechange_state.dart';

class OnPagechangeCubit extends Cubit<OnPagechangeState> {
  OnPagechangeCubit() : super(OnPagechangeState());

  onPageChangeIndex(int index) {
    emit(OnPagechangeState(
      indexPage: index,
    ));
  }
}
