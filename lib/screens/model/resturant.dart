class Resturant {
  String? id;
  String? name;
  String? tags;
  String? rating;
  String? discount;
  String? primaryImage;
  String? distance;

  Resturant(
      {this.id,
      this.name,
      this.tags,
      this.rating,
      this.discount,
      this.primaryImage,
      this.distance});

  Resturant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tags = json['tags'];
    rating = json['rating'];
    discount = json['discount'];
    primaryImage = json['primary_image'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tags'] = this.tags;
    data['rating'] = this.rating;
    data['discount'] = this.discount;
    data['primary_image'] = this.primaryImage;
    data['distance'] = this.distance;
    return data;
  }
}
