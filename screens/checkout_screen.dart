import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController addressController = TextEditingController();
  String paymentMethod = "بطاقة الائتمان";

  void confirmOrder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("تم تأكيد الطلب"),
        content: Text("شكراً لك! سيتم توصيل طلبك قريبًا."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("حسناً"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إتمام الدفع")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: "عنوان التوصيل"),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: paymentMethod,
              items: ["بطاقة الائتمان", "الدفع عند الاستلام", "باي بال"].map((method) {
                return DropdownMenuItem(value: method, child: Text(method));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
              decoration: InputDecoration(labelText: "طريقة الدفع"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: confirmOrder,
              child: Text("إتمام الطلب"),
            ),
          ],
        ),
      ),
    );
  }
}
