import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
    required this.quantity,
    required this.notes,
    required this.totalPrice,
  }) : super(key: key);

  final int quantity;
  final String notes;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quantity: $quantity',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Notes: $notes',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Total Price: \$$totalPrice',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
