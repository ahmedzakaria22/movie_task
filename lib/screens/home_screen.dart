import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_task/app_cubit/app_cubit.dart';
import 'package:movie_task/app_cubit/app_states.dart';
import 'package:movie_task/core/functions.dart';
import 'package:movie_task/core/widgets.dart';
import 'package:movie_task/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Movies')),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var appCubit = AppCubit.get(context);
          if (appCubit.popularMovies == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      appCubit.getMovieDetails(
                          movieId: appCubit.popularMovies!.results[index].id);
                      navigateTo(
                          context,
                          DetailsScreen(
                            movieName:
                                appCubit.popularMovies!.results[index].title,
                          ));
                    },
                    child: movieItem(appCubit.popularMovies!.results[index]),
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: appCubit.popularMovies!.results.length,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
