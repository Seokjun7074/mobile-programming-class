import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  void sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    // FirebaseFirestore.instance.collection('${widget.title}');
    final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').doc('${widget.title}').set({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userId': user.uid,
      'userName': userData.data()!['userName'],
    });
    // FirebaseFirestore.instance.collection('chat').add({
    //   'text': _userEnterMessage,
    //   'time': Timestamp.now(),
    //   'userId': user.uid,
    //   'userName': userData.data()!['userName'],
    // });
    _controller.clear();
  }

  var _userEnterMessage = '';
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Talk about movie'),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : sendMessage,
            icon: Icon(
              Icons.send_rounded,
              color:
                  _userEnterMessage.trim().isEmpty ? null : Color(0xfff82f62),
            ),
          ),
        ],
      ),
    );
  }
}
