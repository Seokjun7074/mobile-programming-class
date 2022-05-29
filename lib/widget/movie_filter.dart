import 'package:flutter/material.dart';

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
    List movies = widget.movies;
    String genre = widget.genre;

    final List filteresMovies = genre == 'total'
        ? movies
        : movies.where((movie) => movie['genres'].contains(genre)).toList();
    print(filteresMovies.length);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filteresMovies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          // 영화 내용 들어가는 박스
          child: Container(
            width: 100,
            height: 160,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    // fit: BoxFit.fill,
                    image: NetworkImage(
                      '${filteresMovies[index]['medium_cover_image']}',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    '${filteresMovies[index]['title']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
