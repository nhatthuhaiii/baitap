
import 'package:bai1/detailproduct.dart';
import 'package:bai1/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'Utils/screenUpdateProduct.dart';
import 'entity/product_order.dart';
import 'entity/shopping_source.dart';

class screeen_oder extends StatefulWidget {
  const screeen_oder({super.key});

  @override
  State<screeen_oder> createState() => _screeen_oderState();
}

class _screeen_oderState extends State<screeen_oder> {


  @override
  Widget build(BuildContext context) {


    return SafeArea(child:

    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("My Cart"),
        centerTitle: true,

      ),
      body: Selector<product_provider,int>(

        selector: (BuildContext context ,value ) {
          return value.sl;
        },
        builder: (BuildContext context, value, Widget? child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 12,right: 12,bottom: 6,top: 6),
                    child: Column(
                      children: [

                        for (orderDetail x in context.read<product_provider>().lst)


                          Slidable(
                            startActionPane: ActionPane (
                              motion: BehindMotion(),
                              children: [

                                SlidableAction(onPressed:(context)
                                async
                                {
                                  await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => FractionallySizedBox(
                                      heightFactor: 0.7,
                                      child: UpdateScreen(data: x.item, sl: x.sl),
                                    ),
                                  ).then((_) {

                                   setState(() {});

                                    context.read<product_provider>().setFlag();
                                  });
                                },
                                icon: Icons.settings_outlined,
                                backgroundColor: Colors.blue,)
                              ],


                            ),
                            endActionPane: ActionPane(

                              motion: BehindMotion(),
                              children: [
                                SizedBox(width: 10,),
                                SlidableAction(

                                  onPressed: (context) {
                                    context.read<product_provider>().cancelproduct(x);

                                  },
                                  icon: Icons.remove,
                                  backgroundColor: Colors.red,
                                )

                              ],
                            ),
                            child: Visibility(
                              visible: context.read<product_provider>().sl>0,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Image.network(
                                      "${x.item.image}",
                                      height: 70,
                                      width: 70,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Name: ${x.item.title}"),
                                          Text("Unit: " + "${x.item.category}",),
                                          Text("Price: " + "${x.item.price}",)
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text("x ${x.sl}")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),


                      ],
                    ),
                  ),

                ),
              ),
              Visibility(
                visible: context.read<product_provider>().tonglist()>0 ,
                child: Container(

                  margin: EdgeInsets.only(left: 12,right: 12,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-Total:",style: TextStyle(fontSize: 20,),),
                      Text("\$${context.read<product_provider>().tonglist()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible:  context.read<product_provider>().tonglist()>0,
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
    

    )

    );
  }
}

