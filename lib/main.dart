// import 'dart:js';

import 'package:e_commers/models/card.dart';
import 'package:e_commers/models/product.dart';
import 'package:e_commers/widget/catalog.dart';
import 'package:e_commers/widget/detail.dart';
import 'package:e_commers/widget/shooping_card_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MaterialApp(theme: ThemeData.dark(), home: DetailProduct(product: products,)));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Product product = Product(
    //     id: '1',
    //     name: 'name',
    //     price: 100,
    //     gambar: 'asset/images/img1.jpeg',
    //     description:
    //         "maaf akanlah aku yang membuatmu terluka dan menangis, ukir semua kenangan indah tentang kita berdua");

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CatalogPage(),
        '/shopping_card': (context) => ShoopingCardPage(),
        '/productDetail': (context) => DetailProduct(
            product: ModalRoute.of(context)?.settings.arguments as Product)
      },
      // home: CatalogPage(),
    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: Text("navbar"),
    //   // ),
    //   // body: null,
    //   body: ShoopingCardPage(),
    // );
  }
}

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MyApp(),
  ));
}
