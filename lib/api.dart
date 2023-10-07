import 'package:image/image.dart' as img;
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> getAnswers(
      List<dynamic> values, List<dynamic> equals) async {
    final Dio dio = Dio();

    final res = await dio.post(
        "http://evgeniymuravyov.pythonanywhere.com/process_lists",
        data: {"list1": values, "list2": equals});

    return [res.data["result"], res.data["actions"]];
  }

  Future<List<dynamic>> findNormal(
      List<dynamic> list1, List<dynamic> list2) async {
    final Dio dio = Dio();

    final res = await dio.post(
        "http://evgeniymuravyov.pythonanywhere.com/find_normal",
        data: {"list1": list1, "list2": list2});

    return [res.data["result"], res.data["image"]];
  }

  Future<String> compileCode(String code) async {
    final Dio dio = Dio();

    final res = await dio
        .post("http://evgeniymuravyov.pythonanywhere.com/compile_code", data: {
      "code": code,
    });

    return res.data["result"];
  }

  Future<img.Image?> sendWolfram(String input) async {
    // final Dio dio = Dio();
    //
    // final res = await dio.post("http://api.wolframalpha.com/v1/simple",
    //     queryParameters: {
    //       "appid": "K6G3JW-7UPEA57PVT",
    //       "layout": "divider",
    //       "i": input
    //     });

    http.Response response = await http.get(
        Uri.parse(
            "http://api.wolframalpha.com/v1/simple?appid=K6G3JW-7UPEA57PVT&i=$input&layout=divider&fontsize=26"),
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        });

    var image = img.decodeGif(response.bodyBytes);
    return image;
  }
}
