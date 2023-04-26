import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:procamera/globals/global.dart';
import 'package:procamera/model/models.dart';

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelpers = ApiHelpers._();

  Future<List<Provider>?> getData() async {
    String words = Global.searchData;
    String baseURI =
        "https://pixabay.com/api/?key=35722369-0ff268194d7105d16de321576&q=$words&image_type=photo&pretty=true ";

    String api = baseURI;
    http.Response data = await http.get(Uri.parse(api));

    if (data.statusCode == 200) {
      Map decodeData = jsonDecode(data.body);

      List post = decodeData["hits"];

      List<Provider> allData =
          post.map((e) => Provider.fromMap(data: e)).toList();

      return allData;
    }
    return null;
  }
}
