final class BookDetailsModel {
  final String kind;
  final String id;
  final String eTag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final LayerInfo layerInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;

  BookDetailsModel({
    required this.kind,
    required this.id,
    required this.eTag,
    required this.selfLink,
    required this.volumeInfo,
    required this.layerInfo,
    required this.saleInfo,
    required this.accessInfo,
  });

}

final class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Epub epub;
  final Pdf pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

}

final class Epub {
  final bool isAvailable;
  final String acsTokenLink;

  Epub({
    required this.isAvailable,
    required this.acsTokenLink,
  });

}

final class Pdf {
  final bool isAvailable;

  Pdf({
    required this.isAvailable,
  });

}

final class LayerInfo {
  final List<Layer> layers;

  LayerInfo({
    required this.layers,
  });

}

final class Layer {
  final String layerId;
  final String volumeAnnotationsVersion;

  Layer({
    required this.layerId,
    required this.volumeAnnotationsVersion,
  });

}

final class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;
  final SaleInfoListPrice listPrice;
  final SaleInfoListPrice retailPrice;
  final String buyLink;
  final List<Offer> offers;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    required this.listPrice,
    required this.retailPrice,
    required this.buyLink,
    required this.offers,
  });

}

final class SaleInfoListPrice {
  final double amount;
  final String currencyCode;

  SaleInfoListPrice({
    required this.amount,
    required this.currencyCode,
  });

}

final class Offer {
  final int finskyOfferType;
  final OfferListPrice listPrice;
  final OfferListPrice retailPrice;

  Offer({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
  });

}

final class OfferListPrice {
  final int amountInMicros;
  final String currencyCode;

  OfferListPrice({
    required this.amountInMicros,
    required this.currencyCode,
  });

}

final class VolumeInfo {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String publisher;
  final DateTime publishedDate;
  final String description;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final int pageCount;
  final int printedPageCount;
  final Dimensions dimensions;
  final String printType;
  final List<String> categories;
  final double averageRating;
  final int ratingsCount;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final  PenalizationSummary penalizationSummary;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printedPageCount,
    required this.dimensions,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.penalizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

}

final class Dimensions {
  final String height;

  Dimensions({
    required this.height,
  });

}

final class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;
  final String small;
  final String medium;
  final String large;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
  });

}

final class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

}

final class  PenalizationSummary {
  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  PenalizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

}

final class ReadingModes {
  final bool text;
  final bool image;

  ReadingModes({
    required this.text,
    required this.image,
  });

}
