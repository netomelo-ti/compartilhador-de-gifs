import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomePageAndroid extends StatefulWidget {
  const HomePageAndroid({super.key});

  @override
  State<HomePageAndroid> createState() => _HomePageAndroidState();
}

class _HomePageAndroidState extends State<HomePageAndroid> {
  final String urlApi =
      "api.giphy.com/v1/gifs/search?api_key=wA5cgFGA359gmGRv3wRhsDqZ217bH9bj&q=&limit=10&offset=0&rating=g&lang=pt";

  Future listarGifs() async {
    var url = Uri.https(
      'api.giphy.com',
      '/v1/gifs/search',
      {
        'api_key': 'wA5cgFGA359gmGRv3wRhsDqZ217bH9bj',
        'limit': '10',
        'offset': '0',
        'lang': 'pt',
        'rating': 'g',
        'q': 'cachorro'
      },
    );
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['data'][0]['id'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    listarGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.network(
            "https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif"),
      ),
    );
  }
}
