import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var endpoint = 'https://api.adviceslip.com/advice';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String> _getAdvice() async {
    var response = await http.get(Uri.parse(endpoint));
    var res = json.decode(response.body);
    return res['slip']['advice'];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<String>(
            future: _getAdvice(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data!);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
