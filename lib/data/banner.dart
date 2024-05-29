class BannerEntity {
  int id;
  String imageUrl;

  BannerEntity.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image'];
}
