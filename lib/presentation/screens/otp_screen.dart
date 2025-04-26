import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_cubit.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_states.dart';
import 'package:firebase_phone_auth/constant/strings.dart';
import 'package:firebase_phone_auth/helper/show_progress_indicator.dart';
import 'package:firebase_phone_auth/helper/show_snack_bar.dart';
import 'package:firebase_phone_auth/presentation/widgets/custom_black_button.dart';
import 'package:firebase_phone_auth/presentation/widgets/pin_code_fields.dart';
import 'package:firebase_phone_auth/presentation/widgets/verify_text.dart';

class OtpScreen extends StatefulWidget {
  final dynamic phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthStates>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is AuthLoadingState) {
                showProgressIndicator(context);
              } else if (state is PhoneOtpVerified) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  mapScreen,
                );
              } else if (state is AuthErrorState) {
                showSnackBar(context, state.errorMessage);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 88,
              ),
              child: Column(
                children: [
                  const VerifyText(),
                  const SizedBox(
                    height: 88,
                  ),
                  PinCodeFields(
                    onComplete: (code) {
                      otpCode = code;
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomBlackButton(
                    press: () {
                      showProgressIndicator(context);
                      BlocProvider.of<AuthCubit>(context).submitOtp(otpCode);
                    },
                    title: 'Verify',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
