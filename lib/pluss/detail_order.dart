import 'package:bai1/entity/orderproduct.dart';
import 'package:bai1/entity/product.dart';
import 'package:bai1/provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:provider/provider.dart';

import '../entity/product_order.dart';

class orderdetail extends StatefulWidget {
   orderdetail({super.key});

  @override
  State<orderdetail> createState() => _orderdetailState();
}

class _orderdetailState extends State<orderdetail> {
  @override

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(

      body: Selector<order_provider, int>(
        selector: (BuildContext context, value) {
          return value.sl;
        },
        builder: (BuildContext context, value, Widget? chile) {
          return Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  Spacer(),
                  Center(
                      child: Text(
                    "My Shopping Cart",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  )),
                  Spacer(),

                  Stack(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => orderdetail()));
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 40,
                          )),


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
                                child: Center(
                                    child: Text(
                              context.read<order_provider>().lst.length.toString(),
                              style: TextStyle(color: Colors.white),
                            )))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Center(
              child: Visibility(
                visible: context.read<order_provider>().sl==0,
                child: Container(

                    child: Center(child: Text("Your cart is Empty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 12,right: 12,bottom: 6,top: 6),
                  child: Column(
                    children: [

                      for (orderproduct x in context.read<order_provider>().lst)
                        Visibility(
                          visible: context.read<order_provider>().sl>0,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Image.asset(
                                  x.a.url,
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name: " + x.a.name),
                                    Text("Unit: " + x.a.unit),
                                    Text("Price: " + x.a.price.toString())
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                                onTap: () {


                                                  context
                                                      .read<order_provider>()
                                                      .removeproduct(x);
                                                },
                                                child: Text("-",style: TextStyle(fontSize: 35),)),
                                            SizedBox(width: 10,),
                                            Text(x.sl.toString()),
                                            SizedBox(width: 10,),
                                            InkWell(
                                                onTap: () {
                                                  orderproduct item =
                                                      new orderproduct(x.a, 1);
                                                  context
                                                      .read<order_provider>()
                                                      .addproduct(item);
                                                },
                                                child: Icon(Icons.add)),
                                          ],
                                        ),
                                        SizedBox(width: 20,),
                                        InkWell(
                                            onTap: () {
                                              context
                                                  .read<order_provider>()
                                                  .cancelproduct(x);
                                              var snackbar = SnackBar(content: Text("đã xoá sản phẩm"),duration:Duration (seconds: 1));
                                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                            },
                                            child: Icon(Icons.delete,color: Colors.red,
                                                ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: context.read<order_provider>().sl>0 ,
              child: Container(

                margin: EdgeInsets.only(left: 12,right: 12,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub-Total:",style: TextStyle(fontSize: 20,),),
                    Text("\$${context.read<order_provider>().tonglist()}"+".00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),


            Visibility(
              visible:  context.read<order_provider>().sl>0,
              child: InkWell(
                onTap: (){
                //  context.read<order_provider>().clearAll();
                },
                child: Container(
                    height: 50,

                  color: Colors.grey.withOpacity(0.7),
                  child: Center(child: InkWell(

                      onTap: (){},
                      child: Text("Proceed to Pay",style: TextStyle(fontSize: 30),))),
                ),
              ),
            )

          ],
                      );
        },
      ),
    ));
  }
}
