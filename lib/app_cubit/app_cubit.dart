import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_task/app_cubit/app_states.dart';
import 'package:movie_task/core/dio_helper.dart';
import 'package:movie_task/models/movie_details.dart';
import 'package:movie_task/models/popular_movies.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  PopularMovies? popularMovies;

  void getHomeData() {
    DioHelper.getData(url: 'popular').then((value) {
      popularMovies = PopularMovies.fromJson(value.data);
      emit(SuccessHomeDataState());
    }).catchError((error) {
      log(error.toString());
      emit(ErrorHomeDataState());
    });
  }

  MovieDetails? movieDetails;
  void getMovieDetails({required int movieId}) {
    movieDetails = null;
    DioHelper.getData(
      url: movieId.toString(),
    ).then((value) {
      movieDetails = MovieDetails.fromJson(value.data);
      emit(SuccessGetMovieDetailsState());
    }).catchError((error) {
      log(error.toString());
      emit(ErrorGetMovieDetailsState());
    });
  }
}
