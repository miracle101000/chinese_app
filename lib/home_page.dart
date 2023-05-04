import 'package:chinese_app/extra_page.dart';
import 'package:chinese_app/subscription_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String currentId = "0";
  bool isWheel = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Column(
        children: [
          SubscriptionWidget(
              isWheel: isWheel,
              onTap: () {
                setState(() {
                  isWheel = !isWheel;
                  currentIndex = 0;
                });
              },
              onSelectedItemChanged: (_) {
                setState(() {
                  currentIndex = _;
                });
              },
              currentIndex: currentIndex,
              currentId: currentId,
              size: size),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 20, right: 20, bottom: 22),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 8),
                      child: Text(
                        '推荐历史',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: _mdata.length,
                            padding: const EdgeInsets.only(top: 20),
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (_mdata[index]['isSucessful']) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ExtraPage()));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, bottom: 0),
                                            child: Text(
                                              "${_mdata[index]['price']}元/次",
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, left: 8, bottom: 8),
                                            child: Text(
                                              "${_mdata[index]['date']}",
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 100,
                                        child: Column(
                                          children: [
                                            if (_mdata[index]['isSucessful'])
                                              const Text(
                                                "已完成",
                                                style: TextStyle(
                                                    color: Color(0xff57C769)),
                                              )
                                            else
                                              Container(
                                                child: const Text(
                                                  "准备中",
                                                  style: TextStyle(
                                                    color: Color(0xffF1503C),
                                                  ),
                                                ),
                                              ),
                                            if (_mdata[index]['isSucessful'])
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xff57C769)
                                                            .withOpacity(0.5)),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                                  child: Text(
                                                    "查看推送记录",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xff57C769)),
                                                  ),
                                                ),
                                              )
                                            else
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        const Color(0xffF1503C)
                                                            .withOpacity(0.5)),
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                                  child: Text("修改时间",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xffF1503C))),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> _mdata = [
    {
      "id": "0",
      "price": 19.9,
      "date": "2023-01-06 22:15",
      "isSucessful": false
    },
    {"id": "1", "price": 19.9, "date": "2023-01-06 22:15", "isSucessful": true},
    {
      "id": "2",
      "price": 19.9,
      "date": "2023-01-06 22:15",
      "isSucessful": false
    },
    {"id": "3", "price": 19.9, "date": "2023-01-06 22:15", "isSucessful": true},
    {
      "id": "4",
      "price": 19.9,
      "date": "2023-01-06 22:15",
      "isSucessful": false
    },
    {"id": "5", "price": 19.9, "date": "2023-01-06 22:15", "isSucessful": true},
  ];
}
