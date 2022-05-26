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
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),

      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: '타이틀!',
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
    print('asdf');
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Scaffold(
      appBar: AppBar(title: Text('${title}')),
      body: Column(children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/movielist');
          },
          child: Center(
            child: Text(
              'button',
            ),
          ),
        ),
      ]),
    );
  }
}
