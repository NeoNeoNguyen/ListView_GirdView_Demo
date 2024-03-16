// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class ProductModel {
  String? id;
  String? name;
  int? price;
  String? img;
  String? des;
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.des,
  });

  ProductModel.fromJson(Map<String, dynamic>json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    des = json['des'];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['img'] = this.img;
    data['des'] = this.des;
    return data;
  }
}
