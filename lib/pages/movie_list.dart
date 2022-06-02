import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobile_final/widget/movie_filter.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    fetchData();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  late List movies = [];
  bool loading = true;

  void fetchData() async {
    Response response =
        await get(Uri.parse("https://yts.mx/api/v2/list_movies.json"));
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(response.body);
      // (parsingData['data']['movies'][0]['title']);
      setState(() {
        movies = parsingData['data']['movies'];
        loading = false;
      });
    } else {
      throw Exception('API 불러오기 실패');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Color(0xff141414),
      appBar: AppBar(
        title: Text(
          'SoongCha',
          style: TextStyle(
            color: Color(0xfff82f62),
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // iconTheme: IconThemeData(
        //   color: Colors.grey[800],
        // ),
      ),
      body: loading
          ? Center(
              child: SizedBox(
                width: width / 5,
                child: Lottie.asset('assets/movie-loading.json'),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  FilteredMovieList(movies: movies, genre: 'Total'),
                  FilteredMovieList(movies: movies, genre: 'Drama'),
                  FilteredMovieList(movies: movies, genre: 'Comedy'),
                  FilteredMovieList(movies: movies, genre: 'Action'),
                ],
              ),
            ),
    );
  }
}
