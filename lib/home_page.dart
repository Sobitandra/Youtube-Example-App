import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  Future<dynamic> fetchAlbum() async {

    // Get Post Put patch

    // Uri.parse('https://jsonplaceholder.typicode.com/albums/1')

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));


    // print("statusCode....   ${response.statusCode}");
    // print("body....   ${response.body}");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APi Requests Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: fetchAlbum(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot);
              if(snapshot.hasData && snapshot.data != null){
                return Text(snapshot.data);
              }
              return CircularProgressIndicator();
            },
          ),
          // FutureBuilder(
          //   future: fetchAlbum(),
          //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //     if(snapshot.hasData && snapshot.data != null){
          //       return Text(jsonDecode(snapshot.data)["title"] ?? "The data is null");
          //     }
          //     return CircularProgressIndicator();
          //   },
          // ),
        ],
      ),
    );
  }
}

// "{
// "userId" : 1
// }"
//
// {
//   "asdad" : 1
// }




