class HomeModel {
  bool? status;
  Data? data;
  HomeModel({this.status, this.data});
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;
  Data({this.banners, this.products, this.ad});
  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }
}

class Banners {
  int? id;
  String? image;

  void product;
  Banners({this.id, this.image, this.product});
  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];

    product = json['product'];
  }
}

class Products {
  int? id;
  dynamic  price;
  dynamic  oldPrice;
  int? discount;
  String? image;
  String? name;

  bool? inFavorites;
  bool? inCart;

  Products(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.inFavorites,
      this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
