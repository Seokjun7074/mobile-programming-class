import 'package:flutter/material.dart';

import '../pages/movie_detail.dart';

class FilteredMovieList extends StatefulWidget {
  final List movies;
  final String genre;

  const FilteredMovieList({
    Key? key,
    required this.movies,
    required this.genre,
  }) : super(key: key);

  @override
  State<FilteredMovieList> createState() => _FilteredMovieListState();
}

class _FilteredMovieListState extends State<FilteredMovieList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List movies = widget.movies;
    String genre = widget.genre;

    final List filteresMovies = genre == 'total'
        ? movies
        : movies.where((movie) => movie['genres'].contains(genre)).toList();
    // print(filteresMovies.length);

    return Column(
      children: [
        SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 0, 7),
            child: Text(
              '${genre}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.grey[800]),
            ),
          ),
        ),
        Container(
          height: height / 4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteresMovies.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                // 영화 내용 들어가는 박스
                child: Container(
                  width: 105,
                  // height: 160,

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // print('${filteresMovies[index]['title']}');
                          Navigator.pushNamed(
                            context,
                            '/moviedetail',
                            arguments: MovieArgument(
                              movies: filteresMovies,
                              index: index,
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            // fit: BoxFit.fill,
                            image: NetworkImage(
                              '${filteresMovies[index]['medium_cover_image']}',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(
                          // color: Colors.blueAccent,
                          child: Text(
                            '${filteresMovies[index]['title']}',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
