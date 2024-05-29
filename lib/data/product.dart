class SortProduct{
  static const latest=0;
  static const popular=1;
  static const highToLowPrice=2;
  static const lowToHighPrice=3;
}

class ProductEntity{
  final int id;
  final String title;
  final String imageUrl;
  final int price;
  final int discount;
  final int previousPrice;

  ProductEntity.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'],
        imageUrl = json['image'],
        discount = json['discount'],
        previousPrice = json['previous_price']??json['price'];
}
