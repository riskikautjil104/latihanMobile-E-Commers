import 'package:e_commers/models/card.dart';
import 'package:e_commers/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          "Halaman detail Product",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            product.gambar,
            fit: BoxFit.cover,
            height: 300,
          ),
          ListTile(
            title: Text(product.name),
            subtitle: Text('Rp ${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text("Deskripsi : "),
            subtitle: Text(product.description),
          ),
        ],
      ),
      persistentFooterButtons: [
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: TextButton.icon(
            icon: Icon(Icons.shopping_cart),
            label: Text("Tambah Ke keranjang"),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).addToCart(product);
              Navigator.pushNamed(context, '/shopping_card');
            },
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 199, 197, 197)),
          ),
        ),
      ],
    );
  }
}

// void main() {
//   Product product;
//   runApp(MaterialApp(
//     home: DetailProduct(
//         product: product = Product(
//             id: '1',
//             name: 'name',
//             price: 100,
//             gambar: 'asset/images/img1.jpeg',
//             description:
//                 "maaf akanlah aku yang membuatmu terluka dan menangis, ukir semua kenangan indah tentang kita berdua")),
//   ));
// }
