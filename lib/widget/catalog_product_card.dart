// import 'dart:html';

import 'package:e_commers/models/product.dart';
import 'package:flutter/material.dart';

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/productDetail", arguments: product);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              product.gambar,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text('Rp ${product.price}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_bag),
                        label: Text("Makasi kaka"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Color.fromARGB(255, 249, 249, 249),
                        ),
                      )
                    ],
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
