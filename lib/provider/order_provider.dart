import 'package:flutter/cupertino.dart';

import '../entity/orderproduct.dart';
import '../entity/product.dart';

class order_provider extends ChangeNotifier{

  bool isRenderOverlay = false;
   List<orderproduct> lst=[];
   int sl =0;
   int sum =0;
  addproduct(orderproduct a ){

  lst.add(a);
  sl++;
  for(int i =0;i <lst.length;i++){
    for(int j=0;j<lst.length;j++){
      if(j!=i && lst[i].a.name==lst[j].a.name)
          {
            lst[i].sl = lst[i].sl+lst[j].sl;
            lst.remove(lst[j]);
          }

    }

  }
  setFlag();
  }
  removeproduct(orderproduct a){
   if(a.sl > 1){
     a.sl = a.sl-1;
      sl--;
   }
   else if(a.sl==1){
    cancelproduct(a);

   }

   setFlag();
  }
  cancelproduct(orderproduct a){
    for(var x in lst){
      if (x.a.name.contains(a.a.name)) {
        sl= sl-x.sl;
        lst.remove(x);
      }
    }
    setFlag();
  }
  tonglist(){
    sum=0;
    for(var x in lst){
      sum = sum+ x.sl*x.a.price;

    }
    return sum;
    setFlag();
  }
  clearAll(){
    sum=0;
    sl=0;

    lst.clear();
    isRenderOverlay=false;
    setFlag();

  }
  @override
  void setFlag({bool render = true}){
   isRenderOverlay = !isRenderOverlay;

   if(render){
    notifyListeners();
   }
  }

}