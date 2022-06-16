import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_task/app_cubit/app_cubit.dart';
import 'package:movie_task/app_cubit/app_states.dart';
import 'package:movie_task/core/widgets.dart';

class DetailsScreen extends StatelessWidget {
  final String movieName;
  const DetailsScreen({Key? key, required this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movieName)),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var appCubit = AppCubit.get(context);
          if (appCubit.movieDetails == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        appCubit.movieDetails!.originalTitle.toString(),
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250.0,
                  width: double.infinity,
                  color: Colors.black12,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      Image(
                        image: NetworkImage(imageSrc +
                            appCubit.movieDetails!.backdropPath.toString()),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SelectableText(
                                    appCubit.movieDetails!.overview!,
                                    maxLines: 9,
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
