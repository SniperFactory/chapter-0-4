import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;

class ViewSecret extends StatefulWidget {
  const ViewSecret({Key? key}) : super(key: key);

  @override
  State<ViewSecret> createState() => _ViewSecretState();
}

class _ViewSecretState extends State<ViewSecret> {
  final endpoint = 'http://3.35.21.162:8090/api/collections/secrets/records';
  Future<Map<String, dynamic>> _getSecrets() async {
    final response = await http.get(Uri.parse(endpoint));
    final res = json.decode(response.body);
    // 임의의 게시물 하나를 가져와야 하므로 Random 사용
    // 0부터 nextInt 안의 값 미만의 수 하나를 추출
    int idx = Random().nextInt(res['totalItems']);
    // 타입 확인은 .runtimeType을 사용한다.
    // print(res['items'][idx].runtimeType);
    return res['items'][idx];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/back.png'),
          // 배경 전체 채우기
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // AppBar를 사용하는 방법
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // 아이콘과 텍스트의 간격 조절
          titleSpacing: -10,
          centerTitle: false,
          // 위의 컬러를 투명으로 지정했어도 그림자는 남아있기 때문에 elevation 을 0으로 설정하거나 shadowColor를 투명으로 설정하여 AppBar 위젯의 그림자를 없애준다.
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 40,
            ),
          ),
          title: const Text('뒤로가기'),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 48),
              height: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/cat.png'),
                ),
              ),
            ),
            // Future를 사용하기위한 FutureBuilder 위젯
            // <>안의 타입은 snapshot.data 값의 타입을 작성해야한다. snapshot.data 값은 Future의 return 값과 같다.
            // 여기선 위의 _getSecret 함수의 return 값인 res['items'][idx] 의 타입인 Map<String, dynamic> 을 써줬다.
            FutureBuilder<Map<String, dynamic>>(
                future: _getSecrets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      children: [
                        Text(
                          snapshot.data!['secret'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          snapshot.data!['author'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
            const SizedBox(
              height: 96,
            ),
          ],
        ),
      ),
    );
  }
}
