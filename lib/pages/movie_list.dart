import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List movies = [];

  void fetchData() async {
    Response response =
        await get(Uri.parse("https://yts.mx/api/v2/list_movies.json"));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(response.body);
      print(parsingData['data']['movies'][0]['title']);
      setState(() {
        movies = parsingData['data']['movies'];
      });
      print(movies[0]['title']);
      print(movies.length);
    } else {
      throw Exception('API 불러오기 실패');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${movies[index]['title']}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }),
    );
  }
}
