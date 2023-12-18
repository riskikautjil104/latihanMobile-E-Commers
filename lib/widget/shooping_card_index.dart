import 'package:e_commers/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card.dart';

class ShoopingCardPage extends StatelessWidget {
  const ShoopingCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Product> items = [
    //   Product(
    //       id: '1',
    //       name: "Keyboard1",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard2",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard3 ",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard4",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard5",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard6",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard7",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard8",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard9",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard10",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    //   Product(
    //       id: '1',
    //       name: "Keyboard11",
    //       price: 100,
    //       gambar: 'asset/images/img1.jpeg'),
    // ];
    // final List<String> items = [
    //   'item1',
    //   'item2',
    //   'item3',
    //   'item4',
    //   'item5',
    //   'item6',
    //   'item7',
    //   'item8',
    //   'item9',
    //   'item10',
    //   'item11',
    // ];
    // final List<int> price = [
    //   100,
    //   200,
    //   300,
    //   400,
    //   500,
    //   500,
    //   600,
    //   800,
    //   900,
    //   100,
    //   1000
    // ];
    // final List<String> gambar = [
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    //   'asset/images/img1.jpeg',
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Shooping Card"),
      ),
      body: Consumer<Cart>(
          builder: (BuildContext context, Cart cart, Widget? child) {
        return ListView.builder(
          // itemCount: items.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(cart.items[index].product.name),
                    leading: Image.asset(
                      cart.items[index].product.gambar,
                      height: 50.0,
                      width: 50.0,
                      fit: BoxFit.cover,
                    ),
                    subtitle: Text('Rp ${cart.items[index].product.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ),
                  TambahCard(
                    index: index,
                  ),
                ],
              ),
            );
            // TambahCard(),
          },
        );
      }),
      bottomNavigationBar: ShoppingCardTotal(),
      // ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (BuildContext context, index) {
      //     return Card(
      //       child: Column(
      //         children: [
      //           ListTile(
      //             title: Text(items[index].name),
      //             leading: Image.asset(
      //               items[index].gambar,
      //               height: 50.0,
      //               width: 50.0,
      //               fit: BoxFit.cover,
      //             ),
      //             subtitle: Text('Rp ${items[index].price}'),
      //             trailing: IconButton(
      //               icon: Icon(Icons.delete),
      //               onPressed: () {},
      //             ),
      //           ),
      //           TambahCard(),
      //         ],
      //       ),
      //     );
      //     // TambahCard(),
      //   },
      // ),
    );
  }
}

class TambahCard extends StatelessWidget {
  const TambahCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).removeFromCart(index);
          },
          icon: Icon(Icons.delete),
        ),
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).decItemQty(index);
          },
          icon: Icon(Icons.remove),
        ),
        Selector<Cart, int>(
          selector: (BuildContext context, Cart cart) {
            return cart.items[index].qty;
          },
          builder: (BuildContext context, int qty, Widget? child) {
            return Text('$qty');
          },
        ),
        IconButton(
          onPressed: () {
            Provider.of<Cart>(context, listen: false).incItemQty(index);
          },
          icon: Icon(Icons.add),
        )
      ],
    );
  }
}

class ShoppingCardTotal extends StatelessWidget {
  const ShoppingCardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.amber))),
      child: Consumer<Cart>(
          builder: (BuildContext context, Cart cart, Widget? index) {
        return ListTile(
          title: Text('Total Price'),
          subtitle: Text('Rp ${cart.totalPrice}'),
          trailing: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 150),
            child: TextButton(
              child: const Text('checkout'),
              style: TextButton.styleFrom(
                backgroundColor: cart.items.isNotEmpty
                    ? Color.fromARGB(255, 0, 30, 139)
                    : Color.fromARGB(255, 149, 255, 204),
              ),
              onPressed: cart.items.isNotEmpty ? () {} : null,
            ),
          ),
        );
      }),
    );
  }
}
// class TambahCard extends StatefulWidget {
//   const TambahCard({super.key, required this.index});

//   @override
//   State<TambahCard> createState() => _TambahCardState();
//   final int index;
// }

// class _TambahCardState extends State<TambahCard> {
//   int qty = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         IconButton(
//           onPressed: () {
//             Provider.of<Cart>(context, listen: false).removeFromCart(index);
//           },
//           icon: Icon(Icons.delete),
//         ),
//         IconButton(
//           onPressed: () {
//             Provider.of<Cart>(context, listen: false).decItemQty(index);
//           },
//           icon: Icon(Icons.remove),
//         ),
//         Selector<Cart, int>(
//           selector: (BuildContext context, Cart cart){
//             return cart.items[index].qty;
//           },
//           builder: (BuildContext context, int qty, Widget? child){
//             return Text('$qty');
//           },

//           ),
//         IconButton(
//           onPressed: () {
//             Provider.of<Cart>(context, listen: false).incItemQty(index);
//           },
//           icon: Icon(Icons.add),
//         )
//       ],
//     );
//   }
// }
// void main() {
//   runApp(MaterialApp(home: ShoopingCardPage()));
// }
