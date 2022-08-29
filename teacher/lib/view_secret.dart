import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class ViewSecret extends StatefulWidget {
  const ViewSecret({Key? key}) : super(key: key);

  @override
  State<ViewSecret> createState() => _ViewSecretState();
}

class _ViewSecretState extends State<ViewSecret> {
  final client = PocketBase('http://3.35.21.162:8090/');
  Future<Map<String, dynamic>> _getSecrets() async {
    final result = await client.records.getList('secrets');
    // 임의의 게시물 하나를 가져와야 하므로 Random 사용
    // 0부터 nextInt 안의 값 미만의 수 하나를 추출
    int idx = Random().nextInt(result.totalItems);
    Map<String, dynamic> res = result.items[idx].toJson();
    return res;
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
        // PreferredSize 위젯으로 appBar를 커스텀디자인 할 수 있다.
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(96),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SafeArea(
        //       child: GestureDetector(
        //         onTap: () {
        //           // 뒤로가기 기능
        //           Navigator.pop(context);
        //         },
        //         child: Row(
        //           children: const [
        //             Icon(
        //               Icons.arrow_left_rounded,
        //               size: 48,
        //               color: Colors.white,
        //             ),
        //             Text(
        //               '뒤로가기',
        //               style: TextStyle(color: Colors.white, fontSize: 20),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),

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
