// ignore_for_file: file_names, depend_on_referenced_packages, unused_local_variable, unused_import, non_constant_identifier_names
import 'package:asrooshop/View/Screen/Auth/LoginScreen.dart';
import 'package:asrooshop/View/Screen/CategoryScreen.dart';
import 'package:asrooshop/View/Screen/FavoriteScreen.dart';
import 'package:asrooshop/View/Screen/MainScreen.dart';
import 'package:asrooshop/View/Screen/WelcomeScreen.dart';
import 'package:asrooshop/View/Screen/SettingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends GetxController {
  bool visibility = true;
  bool check = true;
  bool SavePlace = false;
  GetStorage Box = GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  var DisplayName = "".obs;
  var DisplayPhoto = "".obs;
  var DisplayEmail = "".obs;
  int CurrentIndex = 0;
  void visibilit() {
    visibility = !visibility;
    update();
  }

  void ischeck() {
    check = !check;
    update();
  }

  User? get GetData => auth.currentUser;
  @override
  void onInit() {
    super.onInit();

    DisplayName.value = (GetData != null ? GetData!.displayName : "")!;
    // DisplayPhoto.value = (GetData != null ? GetData!.photoURL : "")!;
    DisplayEmail.value = (GetData != null ? GetData!.email : "")!;
  }

  void SignUpFromFirebase({
    required String Email,
    required String Password,
    required String UserName,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: Email,
            password: Password,
          )
          .then((value) => {
                DisplayName.value = UserName,
                auth.currentUser?.updateDisplayName(UserName)
              });
      Get.off(() => MainScreen());
      update();
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = "";
      if (error.code == 'weak-password') {
        print('The password provided is too weak.');
        message = "The password provided is too weak";
      } else if (error.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        message = "The account already exists for that email";
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black,
          backgroundColor: Colors.green);
    } catch (error) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      print(error);
    }
  }

  void LoginFromFirebase(
      {required String Email, required String Password}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(email: Email, password: Password).then((value) => DisplayName.value = auth.currentUser!.displayName!);
      Get.to(() => MainScreen());
      SavePlace = true;
      Box.write("auth", SavePlace);
      update();
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = "";
      if (error.code == 'user-not-found') {
        print('No user found for that email.');
        message = "No user found for that email";
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        message = "Wrong password provided for that user";
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black,
          backgroundColor: Colors.white);
    }
  }

  void ForgotPasswordFromFirebase({required String Email}) async {
    try {
      await auth.sendPasswordResetEmail(email: Email);

      Get.off(() => LoginScreen());
      update();
    } on FirebaseAuthException catch (error) {
      String title = error.code;
      String message = "";
      if (error.code == 'user-not-found') {
        message = "No user found for that email";
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black,
          backgroundColor: Colors.white);
    }
  }

  Future GoogleSignInFromFirebase() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      DisplayName.value = googleUser!.displayName!;
      DisplayPhoto.value = googleUser.photoUrl!;
      DisplayEmail.value = googleUser.email;
      GoogleSignInAuthentication GoogleSign = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: GoogleSign.idToken, accessToken: GoogleSign.accessToken);
      await auth.signInWithCredential(credential);

      SavePlace = true;
      Box.write("auth", SavePlace);
      update();
      Get.off(() => MainScreen());
    } catch (error) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }
  }

  void SignOut() async {
    auth.signOut();
    await GoogleSignIn().signOut();
    String DisplayName = "";
    String DisplayPhoto = "";
    String DisplayEmail = "";
    SavePlace = false;
    Box.remove("auth");
    Get.to(() => WelcomeScreen());
  }

  void FacebookSignInFromFirebase() {}
}
