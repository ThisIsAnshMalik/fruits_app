import 'package:flutter/material.dart';
import 'package:fruits_app/widgets/chat_sample.dart';
import 'package:fruits_app/widgets/custome_card.dart';
import 'package:fruits_app/widgets/send_button.dart';

class EnquiryDetailScreen extends StatefulWidget {
  String seller, delivery, product, variety, price, avgWeight, perBox, boxes;
  EnquiryDetailScreen({
    Key? key,
    required this.avgWeight,
    required this.boxes,
    required this.delivery,
    required this.perBox,
    required this.price,
    required this.product,
    required this.seller,
    required this.variety,
  }) : super(key: key);

  @override
  State<EnquiryDetailScreen> createState() => _EnquiryDetailScreenState();
}

class _EnquiryDetailScreenState extends State<EnquiryDetailScreen> {
  ScrollController scrollController = ScrollController();

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe3e3d5),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          widget.seller,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView(
                  controller: scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Lot Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCard(
                        avgWeight: widget.avgWeight,
                        boxes: widget.boxes,
                        delivery: widget.delivery,
                        perBox: widget.perBox,
                        price: widget.price,
                        product: widget.product,
                        seller: widget.seller,
                        variety: widget.variety),
                    const ChatSample1(),
                    const SizedBox(
                      height: 30,
                    ),
                    ChatSample2(
                      message: "",
                      chatadded: false,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 55,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                            margin: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: messageController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                    hintText: "Message",
                                    border: InputBorder.none),
                              ),
                            )),
                      )),
                  CustomSendButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
