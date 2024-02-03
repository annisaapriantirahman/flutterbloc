import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newsapp/repository/login_repository.dart';
import 'layout/homepage.dart';
import '../bloc/login_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) -> LoginRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) -> 
                LoginBloc(loginRepository: context.read<LoginRepository>())
                  ..add(const InitLogin())
            ),
          ],
          child: HomePage(),
        ), 
      ),
    );
  }
}


