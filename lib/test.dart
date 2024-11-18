import 'package:bai1/Utils/apiService.dart';
import 'package:bai1/detailproduct.dart';
import 'package:bai1/entity/product.dart';
import 'package:bai1/screen_orderdetail.dart';
import 'package:bai1/searchscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'entity/classroom.dart';
import 'entity/shopping_source.dart';

class myshoptest extends StatefulWidget {
  const myshoptest({super.key});

  @override
  State<myshoptest> createState() => _myshopState();
}

class _myshopState extends State<myshoptest> {
  @override
  late Future<List<Product>> lstproduct;
  void initState() {
    // TODO: implement initState
    super.initState();

    lstproduct = apiService.getAllProduct();
  }
  Widget build(BuildContext context) {
    PageController controller = PageController();
    int icontroller =1;
    int onclick=-1;



    void _goToPage(int page) {
      controller.animateToPage(
        page,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Shopping NOW",style: TextStyle(color: Colors.white,),),
          centerTitle: true,
          actions: [
            InkWell(
                onTap: (){
                //  showSearch(context: context, delegate: searchscreen(data));
                },
                child: Container(child: Icon(Icons.search_outlined,color: Colors.white,),)),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>screeen_oder()));

              },
              child: Container(
                  margin: EdgeInsets.only(right: 12,left: 10),
                  child: Icon(Icons.shopping_cart,color: Colors.white,)),
            ),

          ],
        ),
           drawer: Drawer(surfaceTintColor: Colors.white,),
          body:FutureBuilder<List<Product>>(
            future: lstproduct,
            builder: (context,snapshot) {
              if(snapshot.connectionState== ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else {
                if(snapshot.hasData){
                  List<Product> data = snapshot.data!;
                  List<String> category = [];
                  for(var it in data){
                    if(!category.contains(it.category)){
                      String? x = it.category;
                      category.add(x!);
                    }

                  }


                  return  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text("Best Seller",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                        Container(
                          height: 70,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for(var it in data)
                                if(it.rating?.rate as double >= 3.5)
                                InkWell(
                                  onTap: (){
                                    showModalBottomSheet(context: context,isScrollControlled: true, builder: (context)=>

                                        FractionallySizedBox(
                                          heightFactor: 0.9,
                                          child: detailproduct(data: it),
                                        ));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    height:70,
                                    child: Image.network("${it.image}",height: 70,width: 70,),
                                  ),
                                )

                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                            margin: EdgeInsets.only(left: 12),
                            child: Text("Category",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                       SizedBox(height: 10,),
                        Container(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for(int i =0;i<category.length;i++)
                                InkWell(
                                  onTap: (){
                                    icontroller=i;
                                    _goToPage(icontroller);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.photo_camera_back_outlined),
                                      Container(
                                        child: (
                                            Text("${category[i]}")
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          height: 950,
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: controller,
                            onPageChanged: (int page) {
                              setState(() {
                                icontroller = page;
                                if (page == 0) {
                                  onclick = -1;
                                } else {
                                  onclick = page - 1;
                                }
                              });
                            },

                            children: [
                                  for(String name in category)
                                    Container(
                                      height: MediaQuery.of(context).size.height,
                                      child: GridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                            (MediaQuery.of(context).size.height / 1.08),
                                      children: [
                                        for(Product item in data)
                                          if(name==item.category)
                                            InkWell(
                                              onTap: (){
                                                showModalBottomSheet(context: context,isScrollControlled: true
                                                    ,builder: (context)=>

                                                        FractionallySizedBox(
                                                          heightFactor: 0.9,
                                                          child: detailproduct(data: item,),

                                                        ));


                                              },
                                              child: Container(

                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: Colors.black12)),
                                                margin: EdgeInsets.only(left: 5,right: 5,top:5,bottom: 5),
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Center(child: Image.network("${item.image}",height:100,width: 80,fit: BoxFit.fill,)),
                                                    SizedBox(height: 10,),
                                                    Expanded(flex:2,child: Text("${item.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),

                                                    Text("${item.category}",style: TextStyle(fontSize: 14),),
                                                    SizedBox(height: 10,),
                                                    Row(

                                                      children: [
                                                        Text("\$${item.price}",style: TextStyle(fontWeight: FontWeight.bold),),
                                                        Spacer()
                                                        ,Text("bought: ${item.rating?.count}")
                                                      ],
                                                    ),



                                                  ],
                                                ),
                                              ),
                                            )


                                      ],),
                                    )






                            ],
                          ),
                        )



                      ],

                    ),
                  );


                }
                else {
                  return Container(color: Colors.red,height: 10,width: 10,);
                }
              }
            },

          ),
        bottomNavigationBar:
        BottomNavigationBar(

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          ],

        ),


      )
      ,);
  }
}
