import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  String url =
      "data:image/jpeg;base64,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";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      englishtabs1("imgs/dhkh1.jpg","đại học khoa học"),
                      SizedBox(
                        height: 10,
                      ),
                      englishtabs1("imgs/nguyenthithapqc2.jpg","caffe home"),
                      SizedBox(
                        height: 10,
                      ),
                      englishtabs1("imgs/101tondattien.jpg","caffe house"),
                      SizedBox(
                        height: 10,
                      ),
                      englishtabs1("imgs/dhkh1.jpg","huế"),
                      SizedBox(
                        height: 10,
                      ),
                      englishtabs1("imgs/dhkh1.jpg","đại học khoa học"),
                      SizedBox(
                        height: 10,
                      ),




                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  Container englishtabs1(String url,String name) {
    return Container(
                      height: 200,

                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(

                            height: double.infinity,
                            width:510,
                            child: Image.asset(url,fit: BoxFit.fill,),

                          ),
                          Container(

                            height: double.infinity,
                            width: 510,
                            color: Colors.brown,
                            child: Center(child: Text(name,style: TextStyle(fontSize: 38,color: Colors.white),),),
                          ),
                          Container(

                            height: double.infinity,
                            width: 510,
                            color: Colors.red,
                            child: Center(child: Text("123",style: TextStyle(fontSize: 38,color: Colors.white),),),
                          ),

                        ],
                      ),
                    );
  }

  Widget flagVietNam() {
    return Container(
      height: 300,
      margin: EdgeInsets.all(20),
      color: Colors.red,
      child: Icon(
        Icons.star,
        color: Colors.yellow,
        size: 200,
      ),
    );
  }

  Container greedy(String a, Color colorBG, Color textBG) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(url),
      )),

      height: 300,
      //width: 100,
      child: Center(
          child: Text(
        "${a}",
        style: TextStyle(
            color: textBG,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 0.5)
            ]),
      )),
    );
  }

  ListView showEnglishTab(String url, String b) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.red,
          child: Text(b),
        ),
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.blue,
          child: Text(url),
        )
      ],
    );
  }
  
}
