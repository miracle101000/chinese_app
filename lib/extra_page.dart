import 'package:flutter/material.dart';

class ExtraPage extends StatelessWidget {
  ExtraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "推送记录表",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 45 + 11 + 16 + (data.length * 45),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Text("推送（${data.length}人）"),
                      const Text(
                        "(已完成)",
                        style: TextStyle(color: Color(0xff57C769)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: data.map<Widget>((e) => _item(e, context)).toList(),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  _item(var data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey,
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.45),
                    child: Text(
                      data['title'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ],
            ),
            Text(
              data['date'],
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  var data = [
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
    {"image_url": "", "title": "湾湾不完", "date": "2023-01-06 22:15"},
  ];
}
