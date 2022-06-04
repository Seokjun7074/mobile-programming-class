import 'package:flutter/material.dart';
import 'package:mobile_final/pages/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieArgument {
  final List movies;
  final int index;

  MovieArgument({required this.movies, required this.index});
}

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool showOverflow = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final args = ModalRoute.of(context)!.settings.arguments as MovieArgument;
    List movies = args.movies;
    int index = args.index;

    bool _isTextOverflow = movies[index]['summary'].length > 273 ? true : false;
    int genre_num = movies[index]['genres'].length;

    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: width,
                  child: Image(
                    fit: BoxFit.fill,
                    color: Color.fromARGB(97, 0, 0, 0),
                    colorBlendMode: BlendMode.darken,
                    image: NetworkImage(
                      '${movies[index]['background_image']}',
                    ),
                  ),
                ),
                Positioned(
                  top: movies[index]['title'].length >= 29 ? 120 : 140,
                  left: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 270,
                        child: Text(
                          '${movies[index]['title']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Text(
                          '${movies[index]['year']}',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  child: SizedBox(
                    width: width / 4.5,
                    child: Image(
                      image: NetworkImage(
                        '${movies[index]['medium_cover_image']}',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    width: width,
                    child: Text(
                      '장르',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[700], thickness: 1.0),
                  Container(
                    child: Row(
                      children: [
                        for (int i = 0; i < genre_num; i++)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              movies[index]['genres'][i].toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '줄거리',
                            // '${movies[index]['summary'].length}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Visibility(
                            visible: _isTextOverflow,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showOverflow = !showOverflow;
                                  });
                                },
                                child: Icon(
                                  showOverflow
                                      ? Icons.arrow_drop_up_rounded
                                      : Icons.arrow_drop_down_rounded,
                                  size: 28,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[700], thickness: 1.0),
                  Container(
                    height: null,
                    child: Text(
                      '${movies[index]['summary']}',
                      maxLines: showOverflow ? null : 6,
                      overflow: showOverflow
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        '/chatscreen',
                        arguments: ChattingArgument(
                          title: movies[index]['title'],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff82f62),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: width / 3,
                      height: 50,
                      child: Center(
                          child: Text(
                        '토론방 가기',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ],
                // 276
              ),
            ),
          ],
        ),
      ),
    );
  }
}
