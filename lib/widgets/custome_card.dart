import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  var seller, delivery, product, variety, price, avgWeight, perBox, boxes;
  CustomCard({
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(5),
          border: Border.all(
        color: Colors.black,
        width: 0.1,
      )),
      margin: const EdgeInsets.only(bottom: 10),
      height: 185,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      seller,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xff4F4F4F)),
                    )),
              )),
          Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xffF4F4DD),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4F4F4F)),
                              ),
                              const Text(
                                "Product",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff828282)),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                variety,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4F4F4F)),
                              ),
                              const Text(
                                "Variety",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff828282)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Container(
                              height: 27,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(0.3)),
                              child: Center(
                                  child: Text(
                                "₹${price}k",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${avgWeight}gms",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4F4F4F)),
                              ),
                              const Text(
                                "avg weight",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff828282)),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 34,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                perBox,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4F4F4F)),
                              ),
                              const Text(
                                "per box",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff828282)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 34,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                boxes,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4F4F4F)),
                              ),
                              const Text(
                                "boxes",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff828282)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 34,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                delivery,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4F4F4F)),
                              ),
                              const Text(
                                "delivery",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff828282)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
