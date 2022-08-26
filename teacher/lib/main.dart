import 'package:flutter/material.dart';
import 'package:teacher/not_found.dart';
import 'package:teacher/view_secret.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  _renderMenuBox(String menuTitle, String desc, context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotFound(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1.0,
              color: Colors.grey.shade400,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 2.0,
                offset: Offset(4, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: menuTitle,
                  style: const TextStyle(
                    color: Color(0xff895A00),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '\n$desc',
                      style: const TextStyle(
                        color: Color(0xffACACAC),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              const Image(
                image: AssetImage('images/stamp.png'),
                width: 36,
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // 원하는 색상을 지정하려면 Color(0xffHexcode) 0xff 뒤에 Hexcode 를 넣어준다.
          backgroundColor: const Color(0xfffff9c7),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 메인 텍스트 부분
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: '1,332,240건의 비밀을 알고있는',
                    style: TextStyle(
                      color: Color(0xff626262),
                    ),
                    children: [
                      TextSpan(
                        text: '\n비밀듣는 고양이',
                        style: TextStyle(
                          color: Color(0xff895A00),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // 가운데 고양이 이미지 박스
                Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: const Image(
                    image: AssetImage('images/cat.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                // 이미지와 세 개 박스 사이의 간격
                const SizedBox(
                  height: 80,
                ),
                // 박스 디자인 x3
                // 페이지 이동을 하기위해 Builder 위젯으로 감싸준다.
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewSecret(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey.shade400,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                            offset: Offset(4, 4),
                          )
                        ],
                      ),
                      // 박스 속 텍스트, 발도장 디자인
                      child: Row(
                        // 텍스트와 아이콘의 간격을 위해 사용
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: '비밀보기',
                              style: TextStyle(
                                color: Color(0xff895A00),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: '\n오늘의 비밀을 확인하세요',
                                  style: TextStyle(
                                    color: Color(0xffACACAC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Image(
                            image: AssetImage('images/stamp.png'),
                            width: 36,
                          )
                        ],
                      ),
                    ),
                  );
                }),
                _renderMenuBox('비밀 만들기', '비밀을 만들어보세요', context),
                _renderMenuBox('고양이 갤러리', '귀여운 고양이들을 만나보세요', context)
              ],
            ),
          )),
    );
  }
}
