import 'package:flutter/material.dart';
import 'package:mobile_final/pages/chat_screen.dart';
import 'package:mobile_final/pages/login.dart';
import 'package:mobile_final/pages/movie_detail.dart';
import 'package:mobile_final/pages/movie_list.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/moviedetail': (context) => MovieDetail(),
        '/login': (context) => LoginSignupScreen(),
        '/chatscreen': (context) => ChatScreen(),
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String title = widget.title;
    return Scaffold(
      backgroundColor: Colors.black,
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
      ),
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/movie.jpg'), // 배경 이미지
          ),
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: height / 3,
              right: 100,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Center(
                  child: Container(
                    width: width / 2.8,
                    height: height / 13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xfff82f62),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: height / 3,
            //   right: 100,
            //   left: 100,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pushNamed(context, '/movielist');
            //     },
            //     child: Center(
            //       child: Container(
            //         width: width / 2.8,
            //         height: height / 13,
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           color: Color(0xfff82f62),
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(20),
            //               topRight: Radius.circular(20),
            //               bottomLeft: Radius.circular(20),
            //               bottomRight: Radius.circular(20)),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.2),
            //               spreadRadius: 2,
            //               blurRadius: 10,
            //               offset: Offset(0, 3), // changes position of shadow
            //             ),
            //           ],
            //         ),
            //         child: Text(
            //           "시작하기",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             color: Colors.grey[200],
            //             fontSize: 28,
            //             fontWeight: FontWeight.w600,
            //             letterSpacing: 2,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
