class AuthState {
  final bool isUnlocked;
  final bool biometricsAvailable;
  final String? message;
  const AuthState({required this.isUnlocked, required this.biometricsAvailable, this.message});

  AuthState copyWith({bool? isUnlocked, bool? biometricsAvailable, String? message}) {
    return AuthState(
      isUnlocked: isUnlocked ?? this.isUnlocked,
      biometricsAvailable: biometricsAvailable ?? this.biometricsAvailable,
      message: message,
    );
  }
}