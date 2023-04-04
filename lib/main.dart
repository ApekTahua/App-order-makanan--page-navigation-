import 'package:flutter/material.dart';
import 'package:page_navigation/home.dart';
import 'package:page_navigation/order_detail.dart';
import 'package:page_navigation/order_summary.dart';

void main() => runApp(const MyApp());

//make it stateless
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _quantity = 0;
  String _notes = '';
  int _totalPrice = 0;

  void updateOrder(int quantity, String notes, int totalPrice) {
    setState(() {
      _quantity = quantity;
      _notes = notes;
      _totalPrice = totalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(
            // quantity: _quantity,
            // notes: _notes,
            // totalPrice: _totalPrice,
            ),
        '/order_detail': (context) => const OrderDetail(
            // updateOrder: updateOrder,
            ),
        '/order_summary': (context) => OrderSummary(
              quantity: _quantity,
              notes: _notes,
              totalPrice: _totalPrice,
            ),
      },
    );
  }
}
