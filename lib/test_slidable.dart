import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class home_test extends StatefulWidget {
  const home_test({super.key});

  @override
  State<home_test> createState() => _home_testState();
}

class _home_testState extends State<home_test> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Slidable(

        startActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            SlidableAction(
                flex: 2,
                onPressed: ((context){

            }
            ),
              backgroundColor: Colors.cyan,
              icon:Icons.phone
        ),
            SlidableAction(
                flex: 2,
                onPressed: ((context){

                }
                ),
                backgroundColor: Colors.red,
                icon:Icons.architecture
            )

          ],
        ),
        
        child: Container(
          child: Image.asset("imgs/dhkh1.jpg",fit: BoxFit.fill,),
          
          
        ),
      )


      ),
    );
  }
}
