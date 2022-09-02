import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

var uidKey = 'FluentBooks_Author_uid';

initialise()async{
  prefs = await SharedPreferences.getInstance();
}

setUid(String uid)async{
  if(prefs == null){
    await initialise();
  }
  prefs!.setString(uidKey, uid);
}

getUid() async{
  if(prefs == null){
    await initialise();
  }
  var uid = (await prefs!.getString(uidKey) )?? '';
  return uid;
}

resetSharePref(){
  setUid('');
}



