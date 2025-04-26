abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}

class PhoneNumberSubmitted extends AuthStates {}

class PhoneOtpVerified extends AuthStates {}
