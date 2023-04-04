import 'package:flutter/material.dart';
import 'package:page_navigation/order_summary.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  int _totalPrice = 0;

  void _calculateTotalPrice(int quantity) {
    setState(() {
      _totalPrice = quantity * 10;
    });
  }

  void _submitOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderSummary(
          quantity: int.parse(_quantityController.text),
          notes: _notesController.text,
          totalPrice: _totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pilih Jumlah dan Masukkan Catatan',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            //Add padding to the text field
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(24.0)),
              onChanged: (value) {
                _calculateTotalPrice(int.parse(value));
              },
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Add icon button to decrease quantity and increase quantity
                IconButton(
                  onPressed: () {
                    if (int.parse(_quantityController.text) > 0) {
                      _quantityController.text =
                          (int.parse(_quantityController.text) - 1).toString();
                      _calculateTotalPrice(int.parse(_quantityController.text));
                    }
                  },
                  icon: const Icon(Icons.remove, color: Colors.red, size: 28.0),
                ),
              ],
            ),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(24.0)),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Total Price',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$$_totalPrice',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),

            //Add ElevatedButton to submit order
            ElevatedButton(
              onPressed: _submitOrder,
              child: const Text('Order'),
            ),
            const SizedBox(height: 8.0),
            //Add cancel button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
