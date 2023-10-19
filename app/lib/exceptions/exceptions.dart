class RegistrationError implements Exception {
  final String message;

  RegistrationError(this.message);
}

class AuthorizationError implements Exception {
  final String message;

  AuthorizationError(this.message);
}
