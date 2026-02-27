class OnboardingState {
  final int currentIndex;

  const OnboardingState({required this.currentIndex});

  factory OnboardingState.initial() => const OnboardingState(currentIndex: 0);

  OnboardingState copyWith({int? currentIndex}) {
    return OnboardingState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
