class BookModel {
  final String? imageUrl;
  final String? title;
  final String? description;
  final double? price;
  bool? isFavorite;
  double? rating;

  BookModel(
      {this.imageUrl,
      this.isFavorite,
      this.title,
      this.description,
      this.price,
      this.rating});

  BookModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'] ?? '',
        isFavorite = json['isFavorite'] ?? false,
        title = json['title'] ?? '',
        description = json['description'] ?? '',
        price = json['price'] ?? 5,
        rating = json['rating'] ?? 0;

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'isFavorite': isFavorite,
        'title': title,
        'description': description,
        'price': price,
        'rating': rating
      };
}
