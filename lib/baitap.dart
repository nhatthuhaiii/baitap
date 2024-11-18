import 'package:flutter/material.dart';

class baitap1 extends StatelessWidget {
  const baitap1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.brown.withOpacity(0.3),
              height: 250,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                  width: 510,
                  height: 250,
                  child: Image.asset(
                    "imgs/101tondattien.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 510,
                  height: 250,
                  child: Image.asset(
                    "imgs/dhkh1.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 510,
                  height: 250,
                  child: Image.asset(
                    "imgs/nguyenthithapqc2.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 510,
                  height: 250,
                  child: Image.asset(
                    "imgs/dhkh1.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oeschinen Lake Campground",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Kandersteg, Switzeland",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text("41")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.blueAccent,
                            ),
                            Text(
                              "Call",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Column(
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.blueAccent,
                            ),
                            Text(
                              "Route",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.blueAccent,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      "Welcome to the untouched beauty of Oeschinensee in the UNESCO World Heritage Site - a unique natural jewel. Immerse yourself in the idyllic landscape, surrounded by majestic mountains. Nestled in a wild and romantic rocky basin in the Blüemlisalp massif, the Oeschinensee is considered the most beautiful mountain lake in Switzerland.,"
                      "Welcome to the untouched beauty of Oeschinensee in the UNESCO World Heritage Site - a unique natural jewel. Immerse yourself in the idyllic landscape, surrounded by majestic mountains. Nestled in a wild and romantic rocky basin in the Blüemlisalp massif, the Oeschinensee is considered the most beautiful mountain lake in Switzerland.,"
                      "Welcome to the untouched beauty of Oeschinensee in the UNESCO World Heritage Site - a unique natural jewel. Immerse yourself in the idyllic landscape, surrounded by majestic mountains. Nestled in a wild and romantic rocky basin in the Blüemlisalp massif, the Oeschinensee is considered the most beautiful mountain lake in Switzerland."
                      "Welcome to the untouched beauty of Oeschinensee in the UNESCO World Heritage Site - a unique natural jewel. Immerse yourself in the idyllic landscape, surrounded by majestic mountains. Nestled in a wild and romantic rocky basin in the Blüemlisalp massif, the Oeschinensee is considered the most beautiful mountain lake in Switzerland.")
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
