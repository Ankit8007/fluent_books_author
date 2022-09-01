import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

const String baseUrl = '';
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

getMethod({required String url, var data, var callBack}) async {
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
    callBack(0, null, 'Error : $e');
  }
}
