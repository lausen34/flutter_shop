class UserModel {
  //用户id
  int id;
  //token值
  String token;
  //用户名
  String username;
  //手机号
  String mobile;
  //用户头像
  String head_image;
  //用户地址
  String address;

  UserModel({
    this.id,
    this.token,
    this.username,
    this.mobile,
    this.head_image,
    this.address,
  });

  UserModel.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.token = json['token'];
    this.username = json['username'];
    this.mobile = json['mobile'];
    this.head_image = json['head_image'];
    this.address = json['address'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['head_image'] = this.head_image;
    data['address'] = this.address;
    return data;
  }
}
