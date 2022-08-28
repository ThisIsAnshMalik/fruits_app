import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fruits_app/models/fruitsModel.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:fruits_app/screens/enquiry_detail_screen.dart';

class CustomList extends StatelessWidget {
  TextEditingController searchController;
  CustomList({Key? key, required this.searchController}) : super(key: key);

  Future<List<FruitsModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString("json/Fruits.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => FruitsModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
        future: ReadJsonData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            var item = snapshot.data as List<FruitsModel>;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: item.length,
              itemBuilder: (BuildContext context, int index) {
                String name = item[index].seller.toString();
                String price = item[index].price.toString();
                if (searchController.text.isEmpty) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return EnquiryDetailScreen(
                          avgWeight: item[index].avgWeight.toString(),
                          variety: item[index].variety.toString(),
                          seller: item[index].seller.toString(),
                          boxes: item[index].boxes.toString(),
                          perBox: item[index].perBox.toString(),
                          price: item[index].price.toString(),
                          product: item[index].product.toString(),
                          delivery: item[index].delivery.toString(),
                        );
                      })));
                    },
                    child: Container(
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
                                      item[index].seller.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff4F4F4F)),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].product.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "Product",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 32,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].variety.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "Variety",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey
                                                      .withOpacity(0.3)),
                                              child: Center(
                                                  child: Text(
                                                "₹${item[index].price.toString()}k",
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${item[index].avgWeight.toString()}gms",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "avg weight",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].perBox.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "per box",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].boxes.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "boxes",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].delivery.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "delivery",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  );
                } else if (name
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase())) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return EnquiryDetailScreen(
                          avgWeight: item[index].avgWeight.toString(),
                          variety: item[index].variety.toString(),
                          seller: item[index].seller.toString(),
                          boxes: item[index].boxes.toString(),
                          perBox: item[index].perBox.toString(),
                          price: item[index].price.toString(),
                          product: item[index].product.toString(),
                          delivery: item[index].delivery.toString(),
                        );
                      })));
                    },
                    child: Container(
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
                                      item[index].seller.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff4F4F4F)),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].product.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "Product",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 32,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].variety.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "Variety",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey
                                                      .withOpacity(0.3)),
                                              child: Center(
                                                  child: Text(
                                                "₹${item[index].price.toString()}k",
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${item[index].avgWeight.toString()}gms",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "avg weight",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].perBox.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "per box",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].boxes.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "boxes",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].delivery.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "delivery",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  );
                } else if (price
                    .contains(searchController.text.toLowerCase())) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return EnquiryDetailScreen(
                          avgWeight: item[index].avgWeight.toString(),
                          variety: item[index].variety.toString(),
                          seller: item[index].seller.toString(),
                          boxes: item[index].boxes.toString(),
                          perBox: item[index].perBox.toString(),
                          price: item[index].price.toString(),
                          product: item[index].product.toString(),
                          delivery: item[index].delivery.toString(),
                        );
                      })));
                    },
                    child: Container(
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
                                      item[index].seller.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff4F4F4F)),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].product.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "Product",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 32,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].variety.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "Variety",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey
                                                      .withOpacity(0.3)),
                                              child: Center(
                                                  child: Text(
                                                "₹${item[index].price.toString()}k",
                                                style: const TextStyle(
                                                    color: Colors.green,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${item[index].avgWeight.toString()}gms",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "avg weight",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].perBox.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "per box",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].boxes.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "boxes",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item[index].delivery.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff4F4F4F)),
                                              ),
                                              const Text(
                                                "delivery",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff828282)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
