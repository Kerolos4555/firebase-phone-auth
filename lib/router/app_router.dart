import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_cubit.dart';
import 'package:firebase_phone_auth/constant/strings.dart';
import 'package:firebase_phone_auth/presentation/screens/auth_screen.dart';
import 'package:firebase_phone_auth/presentation/screens/map_screen.dart';
import 'package:firebase_phone_auth/presentation/screens/otp_screen.dart';

class AppRouter {
  late AuthCubit authCubit;

  AppRouter() {
    authCubit = AuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const AuthScreen(),
          ),
        );
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );
      default:
        return null;
    }
  }
}
