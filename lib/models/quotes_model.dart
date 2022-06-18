import 'dart:convert';

List<QuotesModel> quotesModelFromJson(String str) => List<QuotesModel>.from(
    json.decode(str).map((x) => QuotesModel.fromJson(x)));

String quotesModelToJson(List<QuotesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
  QuotesModel({
    this.text,
    this.author,
  });

  String? text;
  String? author;

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        text: json["text"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "author": author,
      };
}
