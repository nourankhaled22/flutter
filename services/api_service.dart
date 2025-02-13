import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://fakestoreapi.com"; // مؤقتًا API وهمي

  // جلب قائمة المنتجات
  Future<List<dynamic>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("فشل في تحميل المنتجات");
      }
    } catch (e) {
      throw Exception("خطأ: $e");
    }
  }
}
