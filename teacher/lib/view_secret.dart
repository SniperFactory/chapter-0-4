import 'package:flutter/material.dart';

class ViewSecret extends StatefulWidget {
  const ViewSecret({Key? key}) : super(key: key);

  @override
  State<ViewSecret> createState() => _ViewSecretState();
}

class _ViewSecretState extends State<ViewSecret> {
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
            Text(
              '도서관에 매일 오는 빨간모자 남성분 \n제가 많이 좋아하는거 안비밀',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              '작성자 노란필통',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 96,
            ),
          ],
        ),
      ),
    );
  }
}
