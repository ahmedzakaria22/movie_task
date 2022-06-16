import 'package:flutter/material.dart';
import 'package:movie_task/models/movie_details.dart';
import 'package:movie_task/models/popular_movies.dart';

const imageSrc = 'https://image.tmdb.org/t/p/original';
String? token = '';

Widget movieItem(Result movie) => SizedBox(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image(
                image: NetworkImage(imageSrc + movie.posterPath),
                width: double.infinity,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.7),
                    borderRadius: BorderRadius.circular(15)),
                width: 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 25),
                    const SizedBox(width: 2),
                    Text(movie.voteAverage.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.7),
                borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            child: Text(movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey,
        height: 2,
      ),
    );

Widget buildGenres(Genres genres) => Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          genres.name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
