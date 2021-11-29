import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find();
  User userProfile;

  final GlobalKey<FormState> keyLoginForm = GlobalKey<FormState>();
  final GlobalKey<FormState> keyRegisterForm = GlobalKey<FormState>();
  final GlobalKey<FormState> keyResetPasswordForm = GlobalKey<FormState>();
  final GlobalKey<FormState> keyEditProfileForm = GlobalKey<FormState>();

  var firstnameCtrl = TextEditingController();
  var lastnameCtrl = TextEditingController();

  var emailCtrl = TextEditingController();
  var usernameCtrl = TextEditingController();
  var passCtrl = TextEditingController();
  var passConfirmCtrl = TextEditingController();

  var phoneCtrl = TextEditingController();
  var genderCtrl = TextEditingController();
  var dobCtrl = TextEditingController();

  var streetCtrl = TextEditingController();
  var cityCtrl = TextEditingController();
  var provinceCtrl = TextEditingController();
  var countryCtrl = TextEditingController();
  var postalCodeCtrl = TextEditingController();

  final int delayedAmount = 100;
  var isPasswordSecure = true;
  var isConfirmPasswordSecure = true;
  bool isUsernameAvailable = true;

  @override
  void onInit() async {
    super.onInit();
    await loadData();
    fillUserDataForm();
  }

  loadData() {
    userProfile = UserService().getProfile();
  }

  void fillUserDataForm() async {
    isUsernameAvailable = true;
    firstnameCtrl.text = userProfile?.firstname ?? "";
    lastnameCtrl.text = userProfile?.lastname ?? "";
    genderCtrl.text = userProfile?.gender ?? "";
    streetCtrl.text = userProfile?.address?.street ?? "";
    cityCtrl.text = userProfile?.address?.city ?? "";
    provinceCtrl.text = userProfile?.address?.province ?? "";
    countryCtrl.text = userProfile?.address?.country ?? "Indonesia";
    postalCodeCtrl.text = userProfile?.address?.postalCode ?? "";

    phoneCtrl.text = ConverterHelper.removePhoneCode(userProfile?.phone) ?? "";
    dobCtrl.text = ConverterHelper.stringFormatDmy(userProfile?.dob) ?? "";

    update();
  }

  updateProfile() async {
    if (keyEditProfileForm.currentState.validate()) {
      keyEditProfileForm.currentState.save();
      isUsernameAvailable = false;
      update();
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}
