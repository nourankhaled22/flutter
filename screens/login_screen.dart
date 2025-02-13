import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    // هنا هيتم الاتصال بـ API لما يكون جاهز
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("تسجيل الدخول", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "البريد الإلكتروني")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "كلمة المرور"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => login(context), child: Text("تسجيل الدخول")),
            TextButton(onPressed: () {}, child: Text("ليس لديك حساب؟ إنشاء حساب")),
          ],
        ),
      ),
    );
  }
}
