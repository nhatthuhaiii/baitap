import 'dart:ui';

import 'package:bai1/baitap.dart';
import 'package:bai1/baitap2.dart';
import 'package:flutter/material.dart';

class baitap3 extends StatefulWidget {
  const baitap3({super.key});

  @override
  State<baitap3> createState() => _baitap3State();
}

class _baitap3State extends State<baitap3> {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController=  PageController();
    int itemSelected = 0;
    return SafeArea(

        child:Scaffold(
      drawer: Drawer(
        width:  MediaQuery.of(context).size.width*2/3,
        child: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Text("G", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                    Text("o", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                    Text("o", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.yellow),),
                    Text("g", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                    Text("l", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
                    Text("e", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                    SizedBox(width: 10,),
                    Text("Classroom",style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.5)),)
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Icon(Icons.home_outlined),
                  SizedBox(width: 10,),
                  Text("Lịch",style: TextStyle(fontSize: 18,),)

                ],),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Icon(Icons.calendar_month_outlined,size: 20,),
                  SizedBox(width: 10,),
                  Text("Lớp Học",style: TextStyle(fontSize: 18),)

                ],),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                Container(
                    margin: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                    child: Text("Đ a n g G i ả n g D ạ y",style: TextStyle(color: Colors.black.withOpacity(0.5)),)),
                for(int i = 0 ;i <10;i++)

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 50,
                        child: Center(child: Text("N",style: TextStyle(color: Colors.white),)),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.green),

                      ),
                      SizedBox(width: 5,),
                      Expanded(child:
                      Container(
                        margin: EdgeInsets.only(top: 5,bottom: 5),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lập trình ứng dụng cho các thiết bị di động",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold) ,),
                            Text("2024-2025",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.5)),)
                          ],
                        ),
                      )),

                    ],
                  ),






                Divider(),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.download_for_offline_outlined,size: 20,),
                    SizedBox(width: 10,),
                    Text("Lớp học đã lưu trữ",style: TextStyle(fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.folder_outlined,size: 20,),
                    SizedBox(width: 10,),
                    Text("Thư mục của lớp học",style: TextStyle(fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.settings_outlined,size: 20,),
                    SizedBox(width: 10,),
                    Text("Cài Đặt",style: TextStyle(fontSize: 18),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.help_center_outlined,size: 20,),
                    SizedBox(width: 10,),
                    Text("Trợ giúp",style: TextStyle(fontSize: 18),)
                  ],
                )



              ],


            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title:   Text("Họp Mặt",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      actions: [
        PopupMenuButton(

          splashRadius: 24,
            offset: const Offset(0, 35),
          child: Container(
            margin: EdgeInsets.only(right: 12),
            height: 30,
            width: 30,
            child: Center(child: Text("N",style: TextStyle(color: Colors.white),)),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              color:  Colors.green,
            ),

          )
            ,
          onSelected: (value){

          },
            itemBuilder: (BuildContext context){return const [
              PopupMenuItem(child: Text("Cài đặt"),value: '/caidat',),
              PopupMenuItem(child: Text("Đăng xuất"),value: '/dangxuat',)




            ];
            }),



      ],
      ),

      body:  Container(
        margin: EdgeInsets.only(left: 12,right: 12,top: 10),
        child: Column(
          children: [
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){

                      _pageController.animateToPage(0, duration: Duration(microseconds: 300), curve: Curves.easeIn);
                      setState(() {
                        itemSelected=1;
                        print(itemSelected);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("Cuộc họp mới",style: TextStyle(color: Colors.white),)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(

                    onTap: (
                        ){

                      _pageController.animateToPage(1, duration: Duration(microseconds: 300), curve: Curves.easeIn);
                        setState(() {
                          itemSelected =2;
                        });
                        print(itemSelected);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("Tham gia cuộc họp",style: TextStyle(color: itemSelected == 0 ? Colors.white : Colors.black),)),
                      decoration: BoxDecoration(
                        color: itemSelected == 0 ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(20),

                      ),
                    ),
                  ),
                )

              ],
            ),
            Expanded(

                child: PageView(
              controller:  _pageController,
              scrollDirection: Axis.horizontal,
              children: [

                Center(child: Center(
                  child: Column(
                    children: [

                    SizedBox(height: 100,),
                    CircleAvatar(
                      radius: 110,
                      backgroundImage: AssetImage("imgs/101tondattien.jpg"),
                    ),
                      SizedBox(height: 20,),
                      Text("Cuộc họp luôn an toàn",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("không ai bên ngoài tổ chức có thể tham gia cuộc họp")
                    ],
                  ),
                ),),
                Center(child: Container(
                  color: Colors.green,
                  child: Text("ABC"),),)
              ],
            )),
            MyIndicator(0, 2),









         ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline),label: "Mail",),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined),label: "Meet")
        ],

      ),


          floatingActionButton: FloatingActionButton(
            onPressed: () {

            },
            child: PopupMenuButton(
              splashRadius: 24,
              offset: Offset(0, 100),
                itemBuilder: (BuildContext context) {
                 return  [
                   PopupMenuItem(child: Text("thêm cuộc họp mới")),
                   PopupMenuItem(child: Text("tham gia cuộc họp"))
                 ];

                },
                child: Icon(Icons.add),

            ),
            backgroundColor: Colors.blue,
            shape: CircleBorder(),
          ),

    )
    );

  }


}
MyIndicator(int selected, int length){
return Padding(
   padding: EdgeInsets.only(bottom: 60),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(length, (index){


      return Container(
        height: 5,
        width: 5,
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: selected != index ? Colors.grey : Colors.blue,
          borderRadius:BorderRadius.circular(50),

        ),
      );
    }),
  ),
);

}