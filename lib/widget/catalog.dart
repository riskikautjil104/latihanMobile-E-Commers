import 'package:e_commers/widget/catalog_product_card.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> items = [
      Product(
          id: '1',
          name: "Keyboard1",
          price: 100,
          gambar: 'asset/images/img1.jpeg',
          description:
              "Keyboar super keren sekali jangan ragu kualitasnya oke banget lah pokoknya rekomendasi deh buat kamu"),
      Product(
          id: '1',
          name: "Keyboard2",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard3 ",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard4",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard5",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard6",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard7",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard8",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard9",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard10",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
      Product(
          id: '1',
          name: "Keyboard11",
          price: 100,
          gambar: 'asset/images/img1.jpeg'),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Navbar Home"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, index) {
              return CatalogProductCard(product: items[index]);
            }));
  }
}
