import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  late String verificationID;

  Future<void> submitPhoneNumber({required String phoneNumber}) async {
    emit(AuthLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 40),
      verificationCompleted: verificationComplete,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationComplete(PhoneAuthCredential credential) async {
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException exception) {
    emit(AuthErrorState(errorMessage: exception.toString()));
  }

  void codeSent(String verificationID, int? resendToken) {
    this.verificationID = verificationID;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationID) {}

  Future<void> submitOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: otp,
    );
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerified());
    } catch (exception) {
      emit(AuthErrorState(errorMessage: exception.toString()));
    }
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
