/*
import 'dart:async';

import 'package:flutter/material.dart';

import 'api_service_helper.dart';

class Screen119 extends StatefulWidget {
  const Screen119({Key? key}) : super(key: key);

  @override
  State<Screen119> createState() => _Screen119State();
}

String baseurl = 'https://api.themoviedb.org/3';
String apiKey = 'acc57daff30180ee876a1932eefceaf7';
List<MoviesDetails> movies = [];
List<Genres> genres = [];

class _Screen119State extends State<Screen119> {
  static final ScrollController _scrollController = ScrollController();

  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    DioServiceHelper.init(url: baseurl);
    getGenres();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentIndex < movies.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _scrollToIndex(currentIndex);
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void _scrollToIndex(int index) {
    if (index >= 0 && index < movies.length) {
      setState(() {
        currentIndex = index;
      });
      _scrollController.animateTo(index * 150.0 + (8 * index),
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Movies',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
          ],
        ),

        body: FutureBuilder(
          future: getMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as List<MoviesDetails>;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 225,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(5),
                        controller: _scrollController,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ImageItem(
                              imagePath: data[index].backdrop_path,
                              width: 150,
                              height: 220);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(5),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return FilmInfoItem(
                            imagePath: data[index].backdrop_path,
                            title: data[index].title,
                            rating: data[index].vote_average,
                            voteAverage: data[index].vote_count,
                            genres: data[index].genre_ids.map((e) {
                              return genres
                                  .where((element) => element.id == e)
                                  .toList()[0]
                                  .name;
                            }).toList());
                      },
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 1.8,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key? key,
      required this.imagePath,
      required this.width,
      required this.height})
      : super(key: key);
  final String imagePath;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500$imagePath'),
            fit: BoxFit.cover,
          )),
    );
  }
}

class FilmInfoItem extends StatelessWidget {
  const FilmInfoItem(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.rating,
      required this.voteAverage,
      required this.genres})
      : super(key: key);
  final String imagePath;
  final String title;
  final num rating;
  final num voteAverage;
  final List<String?> genres;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ImageItem(imagePath: imagePath, width: 100, height: 146),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: SizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  genres.join(','),
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                FilmRating(
                  rating: rating,
                  count: voteAverage.toInt(),
                ),
              ]),
        ),
      ),
    ]);
  }
}

class FilmRating extends StatelessWidget {
  const FilmRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          size: 18,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        )
      ],
    );
  }
}

Future<List<MoviesDetails>> getMovies() async {
  var data = await DioServiceHelper.getData(
    endPoint: '/movie/popular?api_key=$apiKey',
  );

  for (var item in data.data['results']) {
    movies.add(MoviesDetails.fromJson(item));
  }

  return movies;
}

Future<List<Genres>> getGenres() async {
  var data = await DioServiceHelper.getData(
    endPoint: '/genre/movie/list?api_key=$apiKey',
  );
  for (var item in data.data['genres']) {
    genres.add(Genres.fromJson(item));
  }
  return genres;
}

class MoviesDetails {
  final String backdrop_path;
  final String title;
  final num id;
  final String original_language;
  final String overview;
  final String release_date;
  final num vote_average;
  final num vote_count;
  final List<dynamic> genre_ids;

  const MoviesDetails(
      {required this.backdrop_path,
      required this.title,
      required this.vote_average,
      required this.vote_count,
      required this.genre_ids,
      required this.original_language,
      required this.release_date,
      required this.overview,
      required this.id});

  factory MoviesDetails.fromJson(Map<String, dynamic> json) {
    return MoviesDetails(
        backdrop_path: json['backdrop_path'] ?? '',
        title: json['title'],
        vote_average: json['vote_average'],
        vote_count: json['vote_count'],
        genre_ids: json['genre_ids'],
        original_language: json['original_language'],
        release_date: json['release_date'],
        overview: json['overview'],
        id: json['id']);
  }
}

class Genres {
  final int id;
  final String name;

  const Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(id: json['id'], name: json['name']);
  }
}
*/
