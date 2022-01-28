// ignore_for_file: avoid_print, unused_local_variable, prefer_collection_literals, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:boc/getmovie.dart';
import 'package:tmdb_api/tmdb_api.dart';

Future<void> main(List<String> args) async {
  String? api = "1d8508b54dec885241f9d445b30b1cda";
  String? token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZDg1MDhiNTRkZWM4ODUyNDFmOWQ0NDViMzBiMWNkYSIsInN1YiI6IjYxZTJkNzFmYzRmNTUyMDA5YTM0ZjUyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F1UXeAPhxTopicRln7Z7lJQzaUyr2UeaW0WMNH005Jk';
  String? imageUrl = 'https://image.tmdb.org/t/p/original';
  //api with out console logs
  final tmdb = TMDB(ApiKeys(api, token));
  // final response = await tmdb.v3.movies.getPopular();
  // final response = await tmdb.v3.movies.getNowPlaying();
  final response = await tmdb.v3.movies.getTopRated();
 // final response = await tmdb.v3.search.queryMovies("dont look up");

  Map<dynamic, dynamic> result = response;
  Map<String, dynamic> data = Map<String, dynamic>();
  for (dynamic type in result.keys) {
    data[type.toString()] = result[type];
  }
  final ew = jsonEncode(data);
  final tmdbGetPopuler = tmdbGetPopulerFromJson(ew);
  const int i = 0;
  int? totalresult = tmdbGetPopuler.totalResults!.bitLength;
  // print(ew);

  for (var i = 0; i <= totalresult; i++) {
    print("++++++++++++++++++++++++++" +
        i.toString() +
        "+++++++++++++++++++++++++++++++++++++");

    print("page: ${tmdbGetPopuler.page}");
    print("Total Page: ${tmdbGetPopuler.totalPages}");
    print("Total Result: ${tmdbGetPopuler.totalResults}");
    print("Adult: ${tmdbGetPopuler.results![i].adult}");
    print("BackdropUrl: ${imageUrl}${tmdbGetPopuler.results![i].backdropPath}");
    print("Genere:${tmdbGetPopuler.results![i].genreIds}");
    print("Id: ${tmdbGetPopuler.results![i].id}");
    print("Original Lang: ${tmdbGetPopuler.results![i].originalLanguage}");
    print("Original Title: ${tmdbGetPopuler.results![i].originalTitle}");
    print("Overview: ${tmdbGetPopuler.results![i].overview}");
    print("Popularity: ${tmdbGetPopuler.results![i].popularity}");
    print("PosterUrl: ${imageUrl}${tmdbGetPopuler.results![i].posterPath}");
    print("Realese date: ${tmdbGetPopuler.results![i].releaseDate}");
    print("Title: ${tmdbGetPopuler.results![i].title}");
    print("Video: ${tmdbGetPopuler.results![i].video}");
    print("Vote avg: ${tmdbGetPopuler.results![i].voteAverage}");
    print("Votecount: ${tmdbGetPopuler.results![i].voteCount}");
    if (i == totalresult) {
      print("++++++++++++++++++++++++++" +
          "  " +
          "end" "   " +
          "+++++++++++++++++++++++++++++++++++++");
    }
  }

//   //api with showing all console logs
//   final tmdbWithLogs = TMDB(
//     ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
//     logConfig: const ConfigLogger.showAll(),
//   );
//   print(await tmdbWithLogs.v3.movies.getPopular());

//   //api with showing all console logs
//   final tmdbWithCustomLogs = TMDB(
//     ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
//     logConfig: const ConfigLogger(
//       //must be true than only all other logs will be shown
//       showLogs: true,
//       showErrorLogs: true,
//     ),
//   );
//   print(await tmdbWithCustomLogs.v3.movies.getPopular());
}
