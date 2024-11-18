import 'dart:html';

import 'package:bai1/entity/product_order.dart';
import 'package:bai1/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'entity/shopping_source.dart';

class detailproduct extends StatefulWidget {
   detailproduct({super.key,required this.data});
  Product? data;
  @override
  State<detailproduct> createState() => _detailproductState();
}

class _detailproductState extends State<detailproduct> {
  @override
  int  count=1;
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          backgroundColor:Colors.grey.withOpacity(0.3),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(

              margin: EdgeInsets.only(left: 12,right: 12,top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [


                    Container(
                        margin: EdgeInsets.only(top:20),
                        child: Center(child: Image.network("${widget.data?.image}",height: 200,width: 200,fit: BoxFit.fill,))),
                    Positioned(
                      right: 40,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: (){Navigator.pop(context);},
                              child: Icon(Icons.shopping_cart,size: 30,))),
                    ),

                    Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: (){Navigator.pop(context);},
                            child: Icon(Icons.close,size: 30,))),

                  ]),



                        SizedBox(height: 20,),
                        Divider(),
                        Text("${widget.data!.title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text("\$ ${widget.data!.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(height: 5,),
                          Row(
                          children: [
                            Row(children: [
                              Text("${widget.data!.rating?.rate.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                              Icon(Icons.star,color: Colors.yellow,)
                            ],),
                            Spacer(),
                            Text("bougt: ${widget.data!.rating?.count.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),


                          ],),
                  Divider(),
                  Text("${widget.data!.description.toString()}",style: TextStyle(fontSize: 16),),

                ],



              ),

            ),
          ],
        ),
      ) ,
         bottomNavigationBar: Selector<product_provider,int>(
           builder: (BuildContext context, value, Widget? child) {
             return Container(
               color: Colors.white,
               padding: EdgeInsets.only(bottom: 10,top: 5,right: 5,left: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(

                     child: Row(
                       children: [
                         SizedBox(width: 40,),
                         InkWell(
                             onTap: ()
                             {

                               if(count>1)
                                 setState(() {
                                   count--;
                                 });


                             },
                             child: Text("-",style: TextStyle(fontSize: 30),)),
                         SizedBox(width: 20,),
                         Text("${count}"),
                         SizedBox(width: 20,),
                         IconButton(onPressed: (){
                           setState(() {
                             count++;
                           });


                         }, icon: Icon(Icons.add)),

                       ],

                     ),
                   ),




                   InkWell(
                     onTap: (){
                       var item = orderDetail(item: widget.data!, sl: count);
                       context.read<product_provider>().addproduct(item);
                       Navigator.pop(context);
                       var sackbar = SnackBar(duration:Duration(milliseconds: 300),content: Text("đã thêm sản phầm  "+widget.data!.title.toString()));
                       ScaffoldMessenger.of(context).showSnackBar(sackbar,);
                     },
                     child: Container(
                       height: 60,
                       width: 200,
                       decoration: BoxDecoration(
                           color: Colors.orangeAccent,
                           borderRadius: BorderRadius.circular(20)
                       ),
                       child: Center(child: Text("ADD TO CART")),
                     ),
                   )
                 ],

               ),
             );
           },
           selector: (BuildContext , value) {
             return value.sl;
           },

         ),
    ));
  }
}
