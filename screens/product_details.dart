import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Column(
        children: [
          Image.network(product['image']),
          SizedBox(height: 10),
          Text(product['title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("السعر: \$${product['price']}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(product['description']),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: Text("إضافة إلى السلة")),
        ],
      ),
    );
  }
}
