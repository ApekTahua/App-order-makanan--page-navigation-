import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('WARTEG',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 245, 103),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      body: ListView.builder(
        itemCount: 5, // number of menu categories
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // navigate to order page for the selected category
              Navigator.pushNamed(context, '/order_detail', arguments: index);
            },
            child: Card(
              //Has different names for each category
              child: Padding(
                //Add background each card
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //When itemcount = 1, shows "Nasi Goreng"
                    if (index == 0)
                      const Text(
                        'Nasi Goreng',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    //When itemcount = 2, shows "Nasi Uduk"
                    if (index == 1)
                      const Text(
                        'Nasi Uduk',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    //When itemcount = 3, shows "Nasi Kuning"
                    if (index == 2)
                      const Text(
                        'Nasi Kuning',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    //When itemcount = 4, shows "Nasi Campur"
                    if (index == 3)
                      const Text(
                        'Nasi Campur',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    //When itemcount = 5, shows "Nasi Putih"
                    if (index == 4)
                      const Text(
                        'Nasi Padang',
                        style: TextStyle(fontSize: 20.0),
                      ),

                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
