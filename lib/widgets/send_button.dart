import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fruits_app/widgets/chat_sample.dart';

class CustomSendButton extends StatelessWidget {
  CustomSendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        child: Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.green),
          child: const Center(
              child: Icon(
            Icons.send_rounded,
            size: 20,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
