import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_task/app_cubit/app_cubit.dart';
import 'package:movie_task/core/dio_helper.dart';
import 'package:movie_task/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHomeData(),
      child: const MaterialApp(
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
