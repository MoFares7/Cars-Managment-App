// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

/// * This class represents a single product model ///
class Product {
  int? id;
  String? name;
  double? price;
  String? ima1;

  int? category_id;
  String? phone_number;
  String? description;
  
  int? reviews_count;
  int? views;
  bool? is_editable;
  int? user_id;
  int? likes_count;
  bool? liked;
  double? new_price;
 
  Product({
    this.id,
    this.name,
    this.price,
    this.ima1,
  
    this.category_id,
    this.phone_number,
    this.description,
   
    this.is_editable,
    this.reviews_count,
    this.views,
    this.user_id,
    this.liked,
    this.new_price,
    this.likes_count,
    // this.reviews,
    //this.discount_list,
  });



  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ima1': ima1,
      'price': price!.toString(),
      'phone_number': phone_number,
       // send date in ISO 8601 Format
      'description': description,
      
      'category_id': category_id.toString(),
      // 'discount_list': jsonEncode(
      //   discount_list!.map((discount) => discount.toMap()).toList(),
      // ),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt(),
      name: map['name'],
      price: map['price']?.toDouble(),
      ima1: map['ima1'],
    
      category_id: map['category_id']?.toInt(),
      phone_number: map['phone_number'],
      description: map['description'],

      reviews_count: map['reviews_count']?.toInt(),
      views: map['views']?.toInt(),
      liked: map['liked'],
      likes_count: map['likes_count'],
      is_editable: map['is_editable'],
      new_price: map['new_price']?.toDouble(),
      /*  reviews: map['reviews']
              .map<Review>((review) => Review.fromMap(review))
              .toList() ??
          [],
      discount_list: map['discounts']
              .map<Discount>((discount) => Discount.fromMap(discount))
              .toList() ??
       [],
    */
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, imageUrl: $ima1, category_id: $category_id, phoneNumber: $phone_number, description: $description, س reviewsCount: $reviews_count, views: $views, newPrice: $new_price )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.ima1 == ima1 &&

        other.category_id == category_id &&
        other.phone_number == phone_number &&
        other.description == description &&
  
        other.reviews_count == reviews_count &&
        other.views == views &&
        other.new_price == new_price;
    //  other.reviews == reviews;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        price.hashCode ^
        ima1.hashCode ^

        category_id.hashCode ^
        phone_number.hashCode ^
        description.hashCode ^
   
        reviews_count.hashCode ^
        views.hashCode ^
        new_price.hashCode;
    // reviews.hashCode;
  }
}
