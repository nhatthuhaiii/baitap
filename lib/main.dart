import 'package:bai1/baitap.dart';
import 'package:bai1/baitap2.dart';
import 'package:bai1/baitap3.dart';
import 'package:bai1/my_homepage.dart';
import 'package:bai1/my_shop.dart';
import 'package:bai1/pluss/getX.dart';
import 'package:bai1/pluss/market.dart';
import 'package:bai1/provider/order_provider.dart';
import 'package:bai1/provider/product_provider.dart';
import 'package:bai1/test.dart';
import 'package:bai1/test_slidable.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context ){return order_provider();}),
        ChangeNotifierProvider(create: (BuildContext context ){return product_provider();})
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home:myshop(),
        //home:home_test(),
       // home:MyHomePage(),
      ),
    );
  }
}
// class routerScreen extends StatefulWidget {
//   routerScreen({super.key,required this.currentPage});
//   final NavigationPages   currentPage;
//   @override
//   State<routerScreen> createState() => _routerScreenState();
// }

// class _routerScreenState extends State<routerScreen> {
//   @override
//   int currentIndex = 0;
//   late List<Widget> _pages;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     currentIndex = widget.currentPage.index;
//    _pages.add(baitap2());
//    _pages.add(baitap3());
//    _pages.add(baitap1());
//
//   }
//   Widget build(BuildContext context) {
//     return SafeArea(child:
//
//     Scaffold(
//       body: body(),
//       bottomNavigationBar:BottomBar(),
//
//     ));
//   }
//
//  Widget body() {
//     return Stack(
//       children: [
//         Container(
//           child: _pages[currentIndex],
//         )
//       ],
//
//     );
//
//   }
//
//   BottomNavigationBar BottomBar() {
//     return BottomNavigationBar(
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Bài tập 1"),
//         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Bài tập 2"),
//         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Bài tập 3"),
//
//
//       ],
//       onTap: onTapNavigationBar,
//     );
//   }
//   void onTapNavigationBar(int value) {
//     switch(NavigationPages.values[value]){
//       case NavigationPages.baitap:
//         changePages(value);
//         break;
//       case NavigationPages.baitap2:
//         changePages(value);
//         break;
//       case NavigationPages.baitap3:
//         changePages(value);
//         break;
//
//       case NavigationPages.my_homepage:
//         changePages(value);
//         break;
//
//     }
//   }
//     void changePages(int value) {
//       setState(() {
//         currentIndex = value;
//       });
//     }
//   }
//
//
//
//
//
//
//
//
//
//
//
//
// enum NavigationPages{
//   baitap2,
//   baitap3,
//   baitap,
//   my_homepage,
// }