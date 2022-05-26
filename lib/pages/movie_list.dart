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
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('movieList'),
    );
  }
}
