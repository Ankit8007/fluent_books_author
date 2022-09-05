import 'dart:async';
import 'dart:io';

import 'package:fluent_books_author/Models/MapModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

const String baseUrl = 'https://www.algowid.net/fluent/api/';
const Map<String, String> headers = {
  'content-type': 'application/x-www-form-urlencoded'
};

postMethod({required String url, var data, var callBack}) async {
  var uri = Uri.parse(baseUrl + url);
  try {
    var res = await http.post(uri, body: data, headers: headers);
    callBack(res.statusCode, res.body, null);
  } on SocketException {
    callBack(101, null, 'No internet connection');
  } on HttpException {
    callBack(0, null, "Couldn't find the post");
  } on FormatException {
    callBack(0, null, "Bad response format");
  } on TimeoutException catch (e) {
    callBack(0, null, e.message);
  } on Error catch (e) {
    callBack(0, null, 'Error : $e');
  }
}

getMethod({required String url, var callBack}) async {
  var uri = Uri.parse(baseUrl + url);
  try {
    var res = await http.get(uri, headers: headers);
    callBack(res.statusCode, res.body, null);
  } on SocketException {
    callBack(101, null, 'No internet connection');
  } on HttpException {
    callBack(0, null, "Couldn't find the post");
  } on FormatException {
    callBack(0, null, "Bad response format");
  } on TimeoutException catch (e) {
    callBack(0, null, e.message);
  } on Error catch (e) {
    print('eeror throw... $e');
    callBack(0, null, 'Error : $e');
  }
}


multiPartMethod({var url, var data, required List<MapModel> images, var callBack}) async {
  var uri = Uri.parse(baseUrl+url);
  try{
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    if(data != null){
      request.fields.addAll(data);
    }
    //multipartFile = new http.MultipartFile("imagefile", stream, length, filename: basename(imageFile.path));
    List<MultipartFile> newList = [];

    for(var item in images){
      var fileName = (item.value.split('/').last);
      var subType = (item.value.split('.').last);
      var imgData = await http.MultipartFile.fromPath(item.key, item.value,contentType: MediaType('image', subType),filename: fileName);
      newList.add(imgData);
    }
    request.files.addAll(newList);

    http.Response response = await http.Response.fromStream(await request.send());
    callBack(response.statusCode,response.body,null);

  } on SocketException {
    callBack(101, null, 'No internet connection');
  } on HttpException {
    callBack(0, null, "Couldn't find the post");
  } on FormatException {
    callBack(0, null, "Bad response format");
  } on TimeoutException catch (e) {
    callBack(0, null, e.message);
  } on Error catch (e) {
    print('eeror throw... $e');
    callBack(0, null, 'Error : $e');
  }

}