import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample1 extends StatelessWidget {
  const ChatSample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClipPath(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text(
                "Hello Buyer we have Apples ready to ship",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: ClipPath(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text(
                "Do let me know",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatSample2 extends StatelessWidget {
  bool chatadded;
  String message;
  ChatSample2({Key? key, required this.chatadded, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ClipPath(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text(
                "How fast can you deliver?",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ),
        chatadded
            ? Padding(
                padding: const EdgeInsets.only(top: 2),
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      message,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
