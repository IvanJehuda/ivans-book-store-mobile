import 'package:flutter/material.dart';
import 'package:ivans_book_store/widgets/left_drawer.dart';
import 'package:ivans_book_store/widgets/product_cart.dart';

class InfoCard extends StatelessWidget {
  final String title; // Judul kartu.
  final String content; // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2306152222'; // NPM
  final String name = 'Ivan Jehuda'; // Nama
  final String className = 'PBP E'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage("Tambah Produk", Icons.add, Colors.amber),
    ItemHomepage("Lihat daftar Produk", Icons.store_rounded, Colors.amber[700]!),
    ItemHomepage("Logout", Icons.logout, Colors.amber[800]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ivans Book Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Ivans Book Store',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      // Pass both `item` and `color` to ItemCard
                      return ItemCard(item: item, color: item.color);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
