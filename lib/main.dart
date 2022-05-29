import 'package:flutter/material.dart';
import 'package:mobile_final/pages/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'Soongflix',
            ),
        '/movielist': (context) => MovieList(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.title;
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
      ),
      body: Column(children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/movielist');
          },
          child: Center(
            child: Text(
              'START',
            ),
          ),
        ),
      ]),
    );
  }
}
