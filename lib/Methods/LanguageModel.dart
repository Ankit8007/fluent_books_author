// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

LanguageModel languageModelFromJson(String str) => LanguageModel.fromJson(json.decode(str));

String languageModelToJson(LanguageModel data) => json.encode(data.toJson());

class LanguageModel {
  LanguageModel({
    this.langId = '',
    this.name = '',
  });

  String langId;
  String name;

  factory LanguageModel.fromJson(var jsonData) {
    try{
      Map<String, dynamic> json = jsonData;
     return  LanguageModel(
        langId: json["langID"] ?? '',
        name: json["name"] ?? '',
      );
    }catch(e){
     return LanguageModel(
        langId: '',
        name: '',
      );
    }}

  Map<String, dynamic> toJson() => {
    "langID": langId,
    "name": name,
  };
}
