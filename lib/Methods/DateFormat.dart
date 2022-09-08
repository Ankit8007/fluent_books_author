import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

const String dateFormat_YYYY_MM_DD = 'yyyy-MM-dd';
const String dateFormat_yyyy_MM_dd_hh_mm_ss = "yyyy-MM-dd hh:mm:ss";




convertDate({DateTime? dateTime, String? date, String? fromPattern, String? toPattern}){
  try{
    DateTime? dt;
    if(date != null){
      dt = DateFormat(fromPattern).parse(date);
    }else{
      dt = dateTime;
    }
    String formattedDate = DateFormat(toPattern).format(dt!);
    return formattedDate;
  }catch(e){
    if (kDebugMode) {
      print(e);
    }
    return '';
  }
}
