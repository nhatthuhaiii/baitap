import 'package:bai1/detailproduct.dart';
import 'package:flutter/material.dart';

import 'entity/shopping_source.dart';

class searchscreen extends SearchDelegate{
  final List<Product> lst ;
  searchscreen(this.lst);
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
   return [
      IconButton(onPressed: (){
        query="";
      }, icon: Icon(Icons.clear))

   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    late List<Product> lstsugestion=[];
    for (var item in lst) {
      if (item.title!.toLowerCase().contains(query.toLowerCase()))
        lstsugestion.add(item);
    }
      return ListView.builder(
        itemCount: lstsugestion.length,
        itemBuilder: (BuildContext context, int index) {
          var rs = lstsugestion[index];
          return InkWell(
            onTap: (){

              showModalBottomSheet(context: context,isScrollControlled: true
                  ,builder: (context)=>

                      FractionallySizedBox(
                        heightFactor: 0.9,
                        child: detailproduct(data: rs,),

                      ));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                
                border: Border.all(color: Colors.black.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(right:5,left: 5,top: 2,bottom: 2),
              child: Row(
                children: [
                  Image.network("${rs.image}",height:40,width: 40,),
                  SizedBox(width: 10,),
                  Expanded(child: Text("${rs.title}"))
                ],
            
              ),
            
            ),
          );
        },


      );
    }
  }

