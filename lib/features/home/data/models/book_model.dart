final class BookModel {

  final VolumeInfo volumeInfo;
  final String id;
  const BookModel({required this.volumeInfo,required this.id});

  factory BookModel.fromJson(Map<String,dynamic> json){
    return BookModel(volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),id: json['id']);

  }

}

final class VolumeInfo {
  const VolumeInfo(
      {required this.title,required this.previewLink, required this.authors, required this.imageLinks});

  final String? title;
  final String? previewLink;
  final List<dynamic>? authors;
  final ImageLinks imageLinks;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
        title: json['title']??'',
        authors: json['authors']??[],
        previewLink: json['previewLink']??'',
        imageLinks: ImageLinks.fromJson(json['imageLinks']??{}));
  }
}

final class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  final String? smallThumbnail;
  final String? thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
        smallThumbnail: json['smallThumbnail']??'', thumbnail: json['thumbnail']??'');
  }
}