// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "hi": "اهلا",
  "datapage": "صفحة البيانات",
  "name": "الاسم",
  "password": "كلمة المرور",
  "email": "البريد الالكتروني",
  "gender": "النوع",
  "birthdate": "تاريخ الميلاد",
  "enter": "ادخل",
  "boy": "ذكر",
  "girl": "انثي",
  "submit": "تسجيل",
  "Please": "من فضلك ادخل",
  "wrong": "غير صحيح",
  "proflie": "الصفحة الشخصية",
  "openMap": "الى الخريطه",
  "lang": "E",
  "newUser": "بيانات جديده",
  "personalData": "المعلومات الشخصية"
};
static const Map<String,dynamic> en = {
  "hi": "hi",
  "datapage": "Data Page",
  "name": "Name",
  "password": "Password",
  "email": "Email",
  "gender": "Gender",
  "birthdate": "Birthdate",
  "enter": "Enter",
  "boy": "Male",
  "girl": "Female",
  "submit": "Submit",
  "Please": "Please Enter",
  "wrong": "is wrong",
  "proflie": "Profile Pgae",
  "openMap": "Go To Map",
  "lang": "ع",
  "newUser": "New Data",
  "personalData": "Personal Data"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
