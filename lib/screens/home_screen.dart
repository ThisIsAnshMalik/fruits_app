import 'package:flutter/material.dart';
import 'package:fruits_app/widgets/bannerWidget.dart';
import 'package:fruits_app/widgets/custom_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Buy",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    onChanged: ((value) {
                      setState(() {});
                    }),
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      hintText: "Search",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: (() {
                      _sortBotttomSheet(context);
                    }),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.sort,
                          size: 26,
                        ),
                        Text("Sort")
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                  // scrollDirection: Axis.vertical,
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BannerWidget(),
                  CustomList(
                    searchController: searchController,
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  void _sortBotttomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: const Color(0xff737373),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(5))),
              height: MediaQuery.of(context).size.height * .33,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 80, 40, 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Name",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Icon(
                          Icons.arrow_upward_outlined,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          size: 25,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Icon(
                          Icons.arrow_upward_outlined,
                          size: 25,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
