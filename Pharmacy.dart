import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final String imageUrl;
  final double price;

  Medicine({required this.name, required this.imageUrl, required this.price});
}

class PharmacyPage extends StatefulWidget {
  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  List<Medicine> _medicines = [    Medicine(      name: 'Centrum',      imageUrl: "assets/images/med1.jpg",      price: 10.0,    ),    Medicine(      name: 'Crestor',      imageUrl: "assets/images/med2.jpg",      price: 15.0,    ),    Medicine(      name: 'Trenbolone',      imageUrl: "assets/images/med3.jpg",      price: 20.0,    ),    Medicine(      name: 'Xtandi',      imageUrl: "assets/images/med4.jpg",      price: 25.0,    ),  ];

  List<Medicine> _cartItems = [];

  double _getCartTotal() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pharmacy')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _medicines.length,
              itemBuilder: (context, index) {
                final medicine = _medicines[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Image.network(
                        medicine.imageUrl,
                        width: 350,
                        height: 350,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(medicine.name, style: TextStyle(fontSize: 18)),
                            SizedBox(height: 8),
                            Text('\$${medicine.price.toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          setState(() {
                            _cartItems.add(medicine);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cart', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = _cartItems[index];
                    return ListTile(
                      title: Text(cartItem.name),
                      subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
                    );
                  },
                ),
                SizedBox(height: 8),
                Text('Total: \$${_getCartTotal().toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
