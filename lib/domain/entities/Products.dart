/// id : 1
/// title : "Essence Mascara Lash Princess"
/// description : "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula."
/// price : 9.99
/// discountPercentage : 7.17
/// rating : 4.94
/// thumbnail : "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"

class ProductsEntity {
  ProductsEntity({
      this.id, 
      this.title, 
      this.description, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.thumbnail,});

  ProductsEntity.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    thumbnail = json['thumbnail'];
  }
  num? id;
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['thumbnail'] = thumbnail;
    return map;
  }

}