import 'package:flutter/material.dart';

class CarMenu extends StatelessWidget {
  const CarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bumblee: Car Rental App")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(child: Text("bmw")),
            SizedBox(height: 20),
            Card(child: Text("audi")),
          ],
        ),
      ),
    );
  }
}
