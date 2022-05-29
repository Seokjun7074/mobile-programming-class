import 'package:flutter/material.dart';

class MovieFilter extends StatefulWidget {
  final List movies;
  final int index;

  const MovieFilter({
    Key? key,
    required this.movies,
    required this.index,
  }) : super(key: key);

  @override
  State<MovieFilter> createState() => _MovieFilterState();
}

class _MovieFilterState extends State<MovieFilter> {
  @override
  Widget build(BuildContext context) {
    List movies = widget.movies;
    int index = widget.index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // 영화 내용 들어가는 박스
      child: Container(
        width: 100,
        height: 160,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          color: Colors.grey[50],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image(
                // fit: BoxFit.fill,
                image: NetworkImage(
                  '${movies[index]['medium_cover_image']}',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                '${movies[index]['title']}',
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
  }
}
