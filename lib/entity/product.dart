class product {
  late String name;
  late String unit;
  late int price;
  late String url;
  product(this.name,this.unit,this.price,this.url);

  static List<product> getlist(){
    List<product> lst = [];
  lst.add(product(("Apple"), "DOZ", 20,"imgs/image2.png"));
    lst.add(product(("Mango"), "DOZ", 30,"imgs/image2.png"));
    lst.add(product(("Banana"), "DOZ", 10,"imgs/image2.png"));
    lst.add(product(("Grapes"), "KG", 8,"imgs/image2.png"));
    lst.add(product(("Watermelon"), "KG", 25,"imgs/image2.png"));
    lst.add(product(("Kiwi"), "PC", 40,"imgs/image2.png"));
    lst.add(product(("Orange"), "DOZ", 15,"imgs/image2.png"));
    lst.add(product(("Peach"), "DOZ", 30,"imgs/image2.png"));


    return lst;
 }



}