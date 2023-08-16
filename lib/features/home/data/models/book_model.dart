final class BookModel {
  final String id;
  final String imageLink;
  final ({String title, List<String> authors}) volumeInfo;

  const BookModel(
      {required this.imageLink, required this.id, required this.volumeInfo});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        imageLink: json['imageLink'],
        id: json['id'],
        volumeInfo: json['volumeInfo']);
  }
}
