abstract interface class ResetPasswordRepo {
  Future<({bool succsuful, String? errorString})> resetPassword(
      {required String email});
}
