import 'dart:convert';

import '../Model/ModelMovies.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> featchmovies() async {
  String URL = "https://smdb.sadeem-lab.com/api/v1/movies";
  final response = await http.get(Uri.parse(URL));
  List<Data> listofmovies = [];
  if (response.statusCode == 200) {

    Map<String, dynamic> list = jsonDecode(response.body);

    dynamic data = list["data"];

    for (int i = 0; i < data.length; i++) {
      listofmovies.add(Data.fromJson(data[i]));
    }
  } else {
    throw Exception("jcdjndjcndfjc");
  }

  return listofmovies;
}
