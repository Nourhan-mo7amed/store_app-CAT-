enum SplashStatus { initial, completed }

class SplashState {
  final SplashStatus status;

  const SplashState({required this.status});

  factory SplashState.initial() =>
      const SplashState(status: SplashStatus.initial);

  SplashState copyWith({SplashStatus? status}) {
    return SplashState(status: status ?? this.status);
  }
}
