import 'package:flutter/material.dart';
import 'package:flutter_yong_sseotni/screens/login.dart';
import 'package:flutter_yong_sseotni/screens/signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7CF5A5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  '지혜롭게 돈 쓰는 방법\n용썼니와 함께',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
            Container(
              width: 320,
              height: 320,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 160,
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/yong_image.png',
                      fit: BoxFit.contain,
                      width: 170, // 이미지 너비
                      height: 170, // 이미지 높이
                    ),
                    const Text(
                      '안녕하세용!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 70),

            // 로그인 버튼
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38D39F),
                minimumSize: const Size(320, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // 회원가입 버튼
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(320, 55),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                side:
                    const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF38D39F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
