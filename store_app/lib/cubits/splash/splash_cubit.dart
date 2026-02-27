import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  Timer? _timer;

  void start() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      emit(state.copyWith(status: SplashStatus.completed));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
