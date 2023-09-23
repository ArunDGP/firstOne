import 'dart:convert';

List<NewsData> newsDataFromJson(String str) =>
    List<NewsData>.from(json.decode(str).map((x) => NewsData.fromJson(x)));

String newsDataToJson(List<NewsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsData {
  final int id;
  final Brand brand;
  final String name;
  final String price;
  final String description;

  final String imageLink;

  NewsData({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
    required this.imageLink,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        id: json["id"] ?? 0, // Provide a default value if null
        brand: brandValues.map[json["brand"]] ??
            Brand.MAYBELLINE, // Provide a default value if null
        name: json["name"] ?? "", // Provide an empty string if null
        price: json["price"] ?? "0.0", // Provide "0.00" as a default if null
        description: json["description"] ?? "",
        imageLink: json["image_link"] ?? "", // Provide an empty string if null
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brandValues.reverse[brand],
        "name": name,
        "price": price,
        "image_link": imageLink,
      };
}

enum Brand { MAYBELLINE }

final brandValues = EnumValues({"maybelline": Brand.MAYBELLINE});

class ProductColor {
  final String hexValue;
  final String colourName;

  ProductColor({
    required this.hexValue,
    required this.colourName,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
