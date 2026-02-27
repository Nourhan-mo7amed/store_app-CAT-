import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  void onPageChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  bool isLastPage(int totalPages) {
    return state.currentIndex == totalPages - 1;
  }
}
