// To parse this JSON data, do
//
//     final slotModel = slotModelFromJson(jsonString);

import 'dart:convert';

SlotModel slotModelFromJson(String str) => SlotModel.fromJson(json.decode(str));

String slotModelToJson(SlotModel data) => json.encode(data.toJson());

class SlotModel {
  SlotModel({
    this.slotId = '',
    this.slot = '',
  });

  String slotId;
  String slot;

  factory SlotModel.fromJson(var jsonData){
    try{
      Map<String,dynamic> json = jsonData;
      return SlotModel(
        slotId: json["slotID"] ?? '',
        slot: json["slot"] ?? '',
      );
    }catch(e){
      return SlotModel(
        slotId: '',
        slot: '',
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "slotID": slotId,
    "slot": slot,
  };
}