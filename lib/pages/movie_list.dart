import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobile_final/widget/movie_filter.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SoongCha',
          style:
              TextStyle(color: Color(0xfff82f62), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieFilter(index: index, movies: movies);
              },
            ),
          ),
        ],
      ),
    );
  }
}
