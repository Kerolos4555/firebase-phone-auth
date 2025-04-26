import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_phone_auth/business_logic/cubits/authentication/auth_cubit.dart';
import 'package:firebase_phone_auth/constant/strings.dart';
import 'package:firebase_phone_auth/presentation/widgets/custom_black_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  AuthCubit cubit = AuthCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => cubit,
        child: Center(
          child: CustomBlackButton(
            press: () {
              cubit.signOut();
              Navigator.pushReplacementNamed(context, loginScreen);
            },
            title: 'log out',
          ),
        ),
      ),
    );
  }
}
