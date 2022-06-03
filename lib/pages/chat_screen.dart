import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_final/chatting/chat/message.dart';
import 'package:mobile_final/chatting/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
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

  @override
  Widget build(BuildContext context) {
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
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/Vhcdxm09nkZibW2T9GqX/message')
      //       .snapshots(),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: Lottie.asset('assets/movie-loading.json'),
      //         // child: CircularProgressIndicator(),
      //       );
      //     }
      //     final docs = snapshot.data!.docs;
      //     print(docs);
      //     return ListView.builder(
      //       itemCount: docs.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return Container(
      //           child: Text(
      //             docs[index]['text'],
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
