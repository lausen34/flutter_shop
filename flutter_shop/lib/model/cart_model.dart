class CartListModel{
  List<CartModel> list;
  CartListModel(this.list);

  CartListModel.fromJson(Map<String,dynamic> json){
    if(json['list'] != null){
      list = List<CartModel>();
      json['list'].forEach((v){
        list.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    if(this.list != null){
      data['list'] = this.list.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class CartModel {
  int id;
  int user_id;
  int good_id;
  int good_count;
  String good_name;
  int good_price;
  String good_image;
  int is_checked;

  CartModel(
    this.id,
    this.user_id,
    this.good_count,
    this.good_name,
    this.good_price,
    this.good_image,
    this.is_checked,
  );

  CartModel.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.user_id = json['user_id'];
    this.good_id = json['good_id'];
    this.good_count = json['good_count'];
    this.good_name = json['good_name'];
    this.good_price = json['good_price'];
    this.good_image = json['good_image'];
    this.is_checked = json['is_checked'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['good_id'] = this.good_id;
    data['good_count'] = this.good_count;
    data['good_name'] = this.good_name;
    data['good_price'] = this.good_price;
    data['good_image'] = this.good_image;
    data['is_checked'] = this.is_checked;
    return data;
  }
}
