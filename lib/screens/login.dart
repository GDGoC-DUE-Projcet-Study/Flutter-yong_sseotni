import 'package:flutter/material.dart';
import 'package:flutter_yong_sseotni/screens/calendar.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    final url = Uri.parse(
        'http://3.36.22.27:8080/Spring-yong_sseotni/api/user/login' // 로그인 API 주소
        );

    try {
      final response = await http.post(
        url,
        body: {
          'user_email': _emailController.text,
          'user_pw': _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        // 로그인 성공
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('로그인 성공했습니다!')),
        );
        // 로그인 성공 후 다음 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CalendarPage()),
        );
      } else {
        // 로그인 실패
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('로그인 실패. 이메일 또는 비밀번호를 확인하세요.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('오류가 발생했습니다. 인터넷 연결을 확인하세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Text(
                      '용썼니',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF12BC4C),
                      ),
                    ),
                    Positioned(
                      right: -85,
                      top: -85,
                      child: Image.asset(
                        'assets/yong_image.png',
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildEmailField(),
                const SizedBox(height: 15),
                _buildPasswordField(),
                const SizedBox(height: 20),
                _buildLoginButton(),
                const SizedBox(height: 20),
                const Text(
                  '또는',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                _buildKakaoLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '아이디',
        prefixIcon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '아이디를 입력해주세요.';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return '유효한 이메일 주소를 입력해주세요.';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '비밀번호',
        prefixIcon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if (value.length < 6) {
          return '비밀번호는 최소 6자리 이상이어야 합니다.';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _loginUser(); // 서버 연동을 위한 메서드 호출
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF12BC4C),
        minimumSize: const Size(double.infinity, 30),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        '용썼니 로그인',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildKakaoLoginButton() {
    return ElevatedButton(
      onPressed: () {
        // 카카오 로그인 처리 로직 추가
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFAE100),
        minimumSize: const Size(double.infinity, 30),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        '카카오 로그인',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}