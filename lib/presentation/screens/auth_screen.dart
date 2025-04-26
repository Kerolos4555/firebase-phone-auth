import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_cubit.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_states.dart';
import 'package:firebase_phone_auth/constant/strings.dart';
import 'package:firebase_phone_auth/helper/show_progress_indicator.dart';
import 'package:firebase_phone_auth/helper/show_snack_bar.dart';
import 'package:firebase_phone_auth/presentation/widgets/intro_text.dart';
import 'package:firebase_phone_auth/presentation/widgets/custom_black_button.dart';
import 'package:firebase_phone_auth/presentation/widgets/phone_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late String phoneNumber;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _phoneFormKey,
          child: SingleChildScrollView(
            child: BlocListener<AuthCubit, AuthStates>(
              listenWhen: (previous, current) => previous != current,
              listener: (context, state) {
                if (state is AuthLoadingState) {
                  showProgressIndicator(context);
                } else if (state is PhoneNumberSubmitted) {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    otpScreen,
                    arguments: phoneNumber,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const IntroText(),
                    const SizedBox(
                      height: 110,
                    ),
                    PhoneForm(
                      save: (value) {
                        phoneNumber = value!;
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomBlackButton(
                      title: 'Next',
                      press: () {
                        showProgressIndicator(context);
                        if (!_phoneFormKey.currentState!.validate()) {
                          Navigator.pop(context);
                          return;
                        } else {
                          Navigator.pop(context);
                          _phoneFormKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context).submitPhoneNumber(
                            phoneNumber: phoneNumber,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
