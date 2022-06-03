import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isME, this.userName, {Key? key})
      : super(key: key);

  final String message;
  final bool isME;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isME ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              width: 145,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  isME ? 'Me' : userName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:
                    isME ? Color.fromARGB(255, 250, 83, 125) : Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              width: 145,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isME ? Colors.grey[200] : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
