class Book {
  String title;
  String author;
  String description;
  String price;
  String imageAsset;
  List<String> imageUrls;
  String officialUrl;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.imageUrls,
    required this.officialUrl,
  });
}
