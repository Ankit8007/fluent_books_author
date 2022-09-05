import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


final ImagePicker _picker = ImagePicker();

launchCamera(callBack)async{
  try{
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    var path = photo!.path;
    if(path.isNotEmpty){
      callBack(true,path);
    }else{
      callBack(false,null);
    }
  }catch(e){
    callBack(false,e.toString());
  }

}

openGallery(callBack)async{
  try{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    var path = image!.path;
    if(path.isNotEmpty){
      callBack(true,path);
    }else{
      callBack(false,null);
    }
  }catch(e){
    callBack(false,e.toString());
  }
}

openBottomSheet({required BuildContext context, required Widget child, bool isExpandable = false}){
  showMaterialModalBottomSheet(
    expand: isExpandable,
    context: context,
    builder: (context) => child,
  );
}