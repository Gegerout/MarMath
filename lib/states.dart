import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_app/api.dart';
import 'package:image/image.dart' as img;

final sendListsProvider = ChangeNotifierProvider((ref) => SendListsNotifier());

class SendListsNotifier extends ChangeNotifier {
  List<dynamic> result = [];
  List<dynamic> actions = [];
  List<dynamic> normalResult = [];
  String codeResult = "";
  img.Image? imageCode;
  String wolframImage = "";

  Future<void> getAnswers(
      List<dynamic> list1, List<dynamic> list2) async {
    result = ["Loading"];
    notifyListeners();
    final data = await Api().getAnswers(list1, list2);
    result = data[0];
    actions = data[1];
    notifyListeners();
  }

  Future<void> findNormal(
      List<dynamic> list1, List<dynamic> list2) async {
    normalResult = ["Loading"];
    notifyListeners();
    final data = await Api().findNormal(list1, list2);
    normalResult = data[0];
    final decodedImage = img.decodeImage(
      latin1.encode(data[1]),
    );
    imageCode = decodedImage;
    notifyListeners();
  }

  Future<void> compileCode(String code) async {
    codeResult = "Loading";
    notifyListeners();
    final data = await Api().compileCode(code);
    codeResult = data;
    notifyListeners();
  }

  Future<void> sendWolfram(String input) async {
    final data = await Api().sendWolfram(input);
    wolframImage = data;
    notifyListeners();
  }

  void clearGaussStates() {
    result = [];
    actions = [];
    notifyListeners();
  }

  void clearNormalStates() {
    normalResult = [];
    imageCode = null;
    notifyListeners();
  }

  void clearCodeStates() {
    codeResult = "";
    notifyListeners();
  }
}
