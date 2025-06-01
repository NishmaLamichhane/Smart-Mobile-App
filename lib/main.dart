import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_folder_mobile_app/constants/app_routes.dart';
import 'package:smart_folder_mobile_app/core/services/service_locator.dart';
import 'package:smart_folder_mobile_app/features/auth/data/repositories/auth_repositories.dart';
import 'package:smart_folder_mobile_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:smart_folder_mobile_app/features/auth/presentation/screens/login_screen.dart';
import 'package:smart_folder_mobile_app/features/auth/presentation/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthBloc(ServiceLocator.getIt<AuthRepositories>()),
        ),
      ],
      child: MaterialApp(
        title: 'Smart Organizer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        routes: {
          AppRoutes.loginScreen: (context) => LoginScreen(),
          AppRoutes.registerScreen: (context) => RegisterScreen(),
        },
      ),
    );
  }
}
