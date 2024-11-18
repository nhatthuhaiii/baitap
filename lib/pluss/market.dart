import 'package:bai1/entity/orderproduct.dart';
import 'package:bai1/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../entity/product.dart';
  import 'detail_order.dart';
  import 'getX.dart';

class makert extends StatefulWidget {
  const makert({super.key});

  @override
  State<makert> createState() => _makertState();
}

class _makertState extends State<makert> {
  @override

  Widget build(BuildContext context) {
    List<product> lst = product.getlist();
    return SafeArea(
        child: Scaffold(
          body: Selector<order_provider,int>(
            selector:(BuildContext context, value){
              return value.sl;
            },
            builder: (BuildContext context,value,Widget? child, ){
              return Column(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 12, right: 12),
                    color: Colors.grey.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Spacer(),
                        Text("Product List",style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.bold),),
                        Spacer(),
                        // InkWell(
                        //     onTap: (){},
                        //     child: Icon(Icons.notifications)),
                        InkWell(
                          onTap: (){
                            showSearch(context: context, delegate: searchItem()


                            );
                          },
                          child: Icon(Icons.search,size:30,color: Colors.black,),
                        ),
                        Container(

                          child: Stack(
                            children: [
                              InkWell(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>orderdetail()));

                                  },
                                  child: Icon(Icons.shopping_cart,color: Colors.black,size: 40,)),
                            context.read<order_provider>().lst.length ==0 ? SizedBox.shrink():
                             Positioned(
                                left: 20,
                                bottom: 20,

                                child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red),
                                    child: Container(


                                        child: Center(child: Text(context.read<order_provider>().lst.length.toString(),style: TextStyle(color: Colors.white),)))),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          for(product x in lst)
                            Container(

                              margin: EdgeInsets.only(left: 10, right: 10,bottom: 5,top: 5),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          x.url,
                                          // color: Colors.white,
                                          height: 100,
                                          width:120,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name: " + x.name,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              "Unit:" + x.unit,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Price: \$" + x.price.toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                             orderproduct it= new orderproduct(x, 1);
                                              context.read<order_provider>().addproduct(it);
                                              var snackBar = SnackBar(content: Text("Bạn đã thêm sản phẩm vào giỏ"),duration:Duration (seconds: 1),);
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(0.9),
                                                borderRadius: BorderRadius.circular(10)),


                                            child: Center(child: Text("ADD TO CART",style: TextStyle(color: Colors.white),)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )



                        ],
                      ),
                    ),
                  ),

                ],
              );}


            ,),
        ));
  }
}

class searchItem extends SearchDelegate{

  List<product> lst = product.getlist();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(

          onPressed: (){

        query ='';}, icon: Icon(Icons.clear,color: Colors.black))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   return IconButton(onPressed: (){
     Navigator.pop(context);


   }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<product> search = [];
    for( product x in lst){
      if( x.name.toLowerCase().contains(query)){
        search.add(x);

      }

    }
    return ListView.builder(



        itemCount:  search.length,

        itemBuilder:(context,index){
        var result = search[index];
        return Container(

          margin: EdgeInsets.only(left: 10, right: 10,bottom: 5,top: 5),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset(
                      search[index].url,
                      // color: Colors.white,
                      height: 100,
                      width:120,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: " + search[index].name,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Unit:" + search[index].unit,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Price: \$" + search[index].price.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        orderproduct it= new orderproduct(search[index], 1);
                        query ='';
                        context.read<order_provider>().addproduct(it);

                      },
                      child: Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10)),


                        child: Center(child: Text("ADD TO CART",style: TextStyle(color: Colors.white),)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),



          );


        } );

  }



}





