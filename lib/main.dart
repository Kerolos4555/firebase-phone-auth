import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_phone_auth/business_logic/cubits/bloc_observer.dart';
import 'package:firebase_phone_auth/constant/strings.dart';
import 'package:firebase_phone_auth/firebase_options.dart';
import 'package:firebase_phone_auth/router/app_router.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen(
    (user) {
      if (user == null) {
        initialRoute = loginScreen;
      } else {
        initialRoute = mapScreen;
      }
    },
  );

  Bloc.observer = MyBlocObserver();

  runApp(
    MyApp(
      router: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
