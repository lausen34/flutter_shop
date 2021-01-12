class HomeContentModel {

  List<HomeBannerModel> banners;
  List<HomeCategoryModel> category;
  List<HomeGoodModel> goods;

  HomeContentModel({
    this.banners,
    this.category,
    this.goods,
  });

  HomeContentModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = List<HomeBannerModel>();
      json['banners'].forEach((v) {
        banners.add(HomeBannerModel.fromJson(v));
      });
    }

    if(json['category'] != null){
      category = List<HomeCategoryModel>();
      json['category'].forEach((v){
        category.add(HomeCategoryModel.fromJson(v));
      });
    }

    if(json['goods'] != null){
      goods = List<HomeGoodModel>();
      json['goods'].forEach((v){
        goods.add(HomeGoodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }

    if (category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }

    if (goods != null) {
      data['category'] = this.goods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//轮播图的模型
class HomeBannerModel {
  String image;

  HomeBannerModel({this.image});

  HomeBannerModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class HomeGoodModel {
  //id
  int id;

  //价格
  int price;

  //这扣价
  int discount_price;

  //商品名称
  String name;

  //编号
  int good_sn;

  //图片
  String images;

  HomeGoodModel({
    this.id,
    this.price,
    this.discount_price,
    this.name,
    this.good_sn,
    this.images,
  });

  HomeGoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    discount_price = json['discount_price'];
    name = json['name'];
    good_sn = json['good_sn'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['discount_price'] = this.discount_price;
    data['name'] = this.name;
    data['good_sn'] = this.good_sn;
    data['images'] = this.images;
    return data;
  }
}

class HomeCategoryModel {
  int id;
  String name;
  int pid;
  String level;
  String images;

  HomeCategoryModel({
    this.id,
    this.name,
    this.pid,
    this.level,
    this.images,
  });

  HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pid = json['pid'];
    level = json['level'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['level'] = this.level;
    data['images'] = this.images;
  }
}
