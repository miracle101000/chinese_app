import 'package:chinese_app/extra_page.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SubscriptionWidget extends StatefulWidget {
  final int currentIndex;
  final String currentId;
  final void Function(int)? onSelectedItemChanged;
  final void Function()? onTap;
  final bool isWheel;
  final Size size;
  const SubscriptionWidget(
      {super.key,
      required this.onSelectedItemChanged,
      required this.isWheel,
      required this.currentIndex,
      required this.onTap,
      required this.currentId,
      required this.size});

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  String currentId = "0";
  int timeIndex = 0, minutesIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 455,
          child: Image.asset(
            'assets/background.png',
            width: widget.size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            '橙心会员',
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        if (widget.isWheel)
          Positioned(
            bottom: 138,
            left: 32,
            right: 32,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                height: 40,
                width: widget.size.width * 0.84,
                decoration: BoxDecoration(
                    color: const Color(0xffF8E2B1).withOpacity(0.45),
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
        if (widget.isWheel)
          const Positioned(
            bottom: 243,
            left: 280,
            // right: 32,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Color(0xffff954d),
                  size: 20,
                ),
                Text(
                  "  2023.5.3",
                  style: TextStyle(
                    color: Color(0xffff954d),
                  ),
                )
              ],
            ),
          ),
        Positioned(
          left: 110,
          bottom: 295,
          child: Container(
            height: 20,
            width: 50,
            decoration:
                BoxDecoration(color: const Color(0xffff954d), boxShadow: [
              BoxShadow(
                color: const Color(0xffff954d).withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 0.1,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ]),
          ),
        ),
        const Positioned(
          left: 40,
          bottom: 245,
          child: SizedBox(
            height: 20,
            // width: ,
            child: Text(
              '24小时加推优推',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        if (!widget.isWheel)
          Positioned(
            left: 30,
            right: 30,
            bottom: -2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: map.map<Widget>((e) => _item(e)).toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Image.asset("assets/button.png"),
                )
              ],
            ),
          )
        else
          Positioned(
            left: 30,
            right: 30,
            bottom: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: 50,
                        height: 100,
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: ListWheelScrollView.useDelegate(
                            itemExtent: 42,
                            perspective: 0.001,
                            overAndUnderCenterOpacity: 0.2,
                            useMagnifier: true,
                            diameterRatio: 1.5,
                            physics: const FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (_) {
                              setState(() {
                                timeIndex = _;
                              });
                            },
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 24,
                              builder: (context, index) {
                                return Center(
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "${24 - index}",
                                          style: TextStyle(
                                            fontSize:
                                                timeIndex == index ? 22 : 18,
                                            color: timeIndex == index
                                                ? const Color(0xffFB8734)
                                                : const Color(0xffB2896B),
                                            fontWeight: timeIndex == index
                                                ? FontWeight.bold
                                                : null,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: timeIndex == index
                                                    ? " 时"
                                                    : "",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xffFB8734)))
                                          ]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: 50,
                        height: 100,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 10),
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: ListWheelScrollView.useDelegate(
                              itemExtent: 40,
                              perspective: 0.005,
                              overAndUnderCenterOpacity: 0.5,
                              diameterRatio: 13,
                              physics: const FixedExtentScrollPhysics(),
                              onSelectedItemChanged: (_) {
                                setState(() {
                                  minutesIndex = _;
                                });
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 60,
                                builder: (context, index) {
                                  return Center(
                                    child: RotatedBox(
                                      quarterTurns: 2,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "${60 - index}",
                                            style: TextStyle(
                                              fontSize: minutesIndex == index
                                                  ? 22
                                                  : 15,
                                              color: minutesIndex == index
                                                  ? const Color(0xffFB8734)
                                                  : const Color(0xffB2896B),
                                              fontWeight: minutesIndex == index
                                                  ? FontWeight.bold
                                                  : null,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: minutesIndex == index
                                                      ? " 分"
                                                      : "",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xffFB8734)))
                                            ]),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.isWheel)
                  const SizedBox(
                    height: 16,
                  ),
                if (widget.isWheel)
                  const Text(
                    "请选择开始推荐的时间，选择确认后提交",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xffC7BBA6), fontSize: null),
                  ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Image.asset("assets/button.png"),
                )
              ],
            ),
          ),
        Positioned(
          left: 22,
          bottom: 280,
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '已为您推荐过',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              SizedBox(
                width: 50,
                height: 53,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 10),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 20,
                      perspective: 0.005,
                      overAndUnderCenterOpacity: 0.5,
                      diameterRatio: 13,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: widget.onSelectedItemChanged,
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 13,
                        builder: (context, index) {
                          return Center(
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: GradientText(
                                '${2023 - index}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                gradientType: GradientType.linear,
                                gradientDirection: GradientDirection.ttb,
                                radius: .4,
                                colors: [
                                  if (widget.currentIndex == index)
                                    Colors.white
                                  else
                                    Colors.deepOrange.withOpacity(0.5),
                                  if (widget.currentIndex == index)
                                    Colors.grey.shade400
                                  else
                                    Colors.deepOrange.withOpacity(0.5)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                '次',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _item(var data) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentId = data['id'];
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Container(
              height: 100 + 19 + 18 + 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:
                      currentId != data['id'] ? null : const Color(0xffFDF9F0),
                  borderRadius: BorderRadius.circular(10),
                  border: currentId != data['id']
                      ? null
                      : Border.all(color: const Color(0xffF3D195))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      data['price'].toString(),
                      maxLines: 1,
                      style: const TextStyle(
                          color: Color(0xff704A18),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    '元/次',
                    style: TextStyle(color: Color(0xff704A18)),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Divider(),
                  ),
                  Text(
                    '推荐给${data['people']}人',
                    style: const TextStyle(color: Color(0xff704A18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  var map = [
    {'id': "0", "price": 19.9, "people": 10},
    {'id': "1", "price": 59.9, "people": 10},
    {'id': "2", "price": 119.9, "people": 10}
  ];
}
