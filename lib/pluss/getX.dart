import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Couter extends GetxController{
    RxInt cnt = 0.obs;
    void add(){
      cnt++;
    }

}
class sinhvienCounter extends GetxController{
  late RxInt id;
  late RxString name;
  sinhvienCounter(this.id,this.name);
}

class Home extends StatelessWidget {

  Home({super.key});


  @override
  Widget build(BuildContext context) {
    final counter = Get.put(Couter());
    final ct = Get.put(sinhvienCounter(123.obs, "Nhat".obs));
    return Scaffold(
    appBar: AppBar(title: Text("CourterX"),
     centerTitle: true
      ,),
      body: Column(
        children: [
          Center(
            child: Obx(()=> Text('${ct.name}',style: TextStyle(fontSize: 20),)),
          ),
          InkWell(
            onTap: (){
             Get.to(ortherscreen());
            },
            child: Text("next screeen"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){counter.add();},
        shape: CircleBorder(),
      ),

    );
  }
}
class ortherscreen extends StatelessWidget {
  const ortherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sinhvienCounter ortherCouter= Get.find();
    return Scaffold(
      body: Column(
        children: [
          InkWell(onTap: (){Navigator.pop(context) ;}
              ,child: Icon(Icons.arrow_back_ios),
          ),
          Center(child: Text("${ortherCouter.name}")),
        ],
      ),
    );
  }
}
