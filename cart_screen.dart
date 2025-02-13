import 'package:flutter/material.dart';

import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"title": "منتج 1", "price": 50.0, "quantity": 1},
    {"title": "منتج 2", "price": 30.0, "quantity": 2},
  ];

  double getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("سلة المشتريات")),
      body: cartItems.isEmpty
          ? Center(child: Text("السلة فارغة"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index]['title']),
                  subtitle: Text("السعر: \$${cartItems[index]['price']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.remove), onPressed: () => decreaseQuantity(index)),
                      Text("${cartItems[index]['quantity']}"),
                      IconButton(icon: Icon(Icons.add), onPressed: () => increaseQuantity(index)),
                      IconButton(icon: Icon(Icons.delete), onPressed: () => removeItem(index)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("الإجمالي: \$${getTotalPrice()}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
                  },
                  child: Text("المتابعة للدفع"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
