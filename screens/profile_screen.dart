import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {"id": "12345", "status": "مكتمل", "total": 80.0, "date": "2024-02-13"},
    {"id": "67890", "status": "قيد التنفيذ", "total": 45.0, "date": "2024-02-10"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("حسابي")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("اسم المستخدم"),
              subtitle: Text("user@example.com"),
            ),
            SizedBox(height: 20),
            Text("سجل الطلبات", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("طلب رقم: ${orders[index]['id']}"),
                      subtitle: Text("التاريخ: ${orders[index]['date']} - الإجمالي: \$${orders[index]['total']}"),
                      trailing: Text(orders[index]['status'], style: TextStyle(color: orders[index]['status'] == "مكتمل" ? Colors.green : Colors.orange)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
