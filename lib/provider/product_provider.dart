import 'package:flutter/foundation.dart';

import '../entity/product_order.dart';

class product_provider extends ChangeNotifier{
  bool isRenderOverlay = false;
  List<orderDetail> lst=[];
  int sl =1;
  double sum =0.0;
  addproduct(orderDetail a ){

    lst.add(a);
    sl++;
    for(int i =0;i <lst.length;i++){
      for(int j=0;j<lst.length;j++){
        if(j!=i && lst[i].item.title == lst[j].item.title)
        {
          lst[i].sl = lst[i].sl+lst[j].sl;
          lst.remove(lst[j]);
        }

      }

    }
    setFlag();
  }
  updateproduct(orderDetail a){
    for(var it in lst){
      if(a.item.title== it.item.title){
        it.sl=a.sl;
      }
    }
    setFlag();

  }
  removeproduct(orderDetail a){
    if(a.sl > 1){
      a.sl = a.sl-1;
      sl--;
    }
    else if(a.sl==1){
      cancelproduct(a);

    }

    setFlag();
  }
  cancelproduct(orderDetail a){
    for(var x in lst){
      if (x.item.title == a.item.title) {
        sl= sl-x.sl;
        lst.remove(x);
      }
    }
    setFlag();
  }



  tonglist(){
    sum=0;
    for(var x in lst){
      sum = sum+ x.sl* (x.item.price as double);

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