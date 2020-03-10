import 'package:complexJson/json.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complex Json',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String link =
      'https://fast-everglades-73327.herokuapp.com/api/v1/borrow/5e541d291ceafc46186160e8';

  //Json fetching and parsing
  getData() async {
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    var data = json.decode(res.body);
    Product rest = Product.fromJson(data);
    print(rest.results[0].bookDatas[0].bookName);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex Json"),
      ),
      body: Container(),
    );
  }
}
