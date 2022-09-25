import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import '../models/user_model.dart' as models;

class AuthController extends GetxController{
  
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;

  //upload to Firebase Storage 
  Future<String>uploadImage(File image)async{
    Reference ref = firebaseStorage.ref().child('profilePics').child(firebaseAuth.currentUser!.uid);
    ref.putFile(image);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

   pickImage() async {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(pickedImage != null){
        Get.snackbar("Profile Picture", "You have successfully added a profile pic");
        
      }

      _pickedImage = Rx<File?>(File(pickedImage!.path));
}

  //registeration of user 
  register(String username,String email, String password, File? image)async{
    try{
       if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null){
          UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
          String downloadUrl = await uploadImage(image);
       models.User user = models.User(name: username, email:email, uid: userCredential.user!.uid, profilePhoto: downloadUrl);
       await fireStore.collection('users').doc(userCredential.user!.uid).set(user.toJson());
       }   
       else{
        Get.snackbar("Error", "Error Creating Account");
       }    

    }catch (error){
      Get.snackbar('Error Creating an Account', error.toString());

    }
  }
}