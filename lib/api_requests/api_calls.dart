import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:morazan/pages/satelites/satelites_model.dart';
import 'package:morazan/util/constants.dart';
import 'package:http/http.dart' as http;
import 'package:string_capitalize/string_capitalize.dart';

Future<SateliteInfo> fetchSateliteInfo(Satelites satelite) async {
  try {
    final res = await http
        .get(Uri.parse("${MorazanApi.apiBase}${satelite.name.capitalize()}"));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body) as Map<String, dynamic>;
      final sateliteInfo = SateliteInfo.fromJson(data);
      return sateliteInfo;
    } else {
      if (kDebugMode) {
        print("error en el fetch por ${res.statusCode}");
      }
      throw Exception(""); // TODO: add a properly exception
    }
  } catch (e) {
    if (kDebugMode) {
      print("error en el fetch por $e");
    }
    rethrow; // TODO: add a properly catch
  }
}
