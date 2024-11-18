import 'package:bai1/entity/classroom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class baitap2 extends StatelessWidget {
  const baitap2({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(

      body: Container(
        margin: EdgeInsets.all(10),
        
        child: SingleChildScrollView(
          child: Column(
          
          children: [
          for(Classroom x in lst)
              classbg(x),



            Slidable(

              startActionPane: ActionPane(
                motion: BehindMotion(),
                children: [
                  SizedBox(width: 10,),

                  SizedBox(width: 10,),
                  SlidableAction(
                    flex:1 ,

                      onPressed: ((context){
                      }
                      ),
                      backgroundColor: Colors.blue,
                      icon:Icons.settings
                  )

                ],
              ),

              child: Container(
                child:classbg(lst[4]),


              ),

              endActionPane: ActionPane(motion: BehindMotion(), children: [
                SlidableAction(
                    flex: 1,
                    onPressed: ((context){

                    }
                    ),
                    backgroundColor: Colors.red,
                    icon:Icons.close
                )

              ],

              ),
            )









          ],
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
            shape:CircleBorder() ,
      ),

    )


    );
  }

  Container classbg(Classroom a) {
    return Container(
              height: 160,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: a.bg,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.subject
                            , style: TextStyle(color: Colors.white,fontSize:22 ),),
                          Text(a.semester,style: TextStyle(color: Colors.white,fontSize: 16)),
                          SizedBox(height:30,),
                          Text(a.totalStudent+"  sinh viên",style: TextStyle(color: Colors.white,fontSize: 16))
                        ],

                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap:(){


                            },
                            child: Icon(Icons.more_horiz,color: Colors.white,)),
                      ],
                    )


                ],

              ),

            );
  }
}
