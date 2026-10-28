import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product.dart';
import 'product_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String username;

  const ProductsPage({
    super.key,
    required this.username,
  });

  @override
  State<ProductsPage> createState() {
    return ProductsPageState();
  }
}

class ProductsPageState extends State<ProductsPage> {
  int favorites = 0;
  double screenWidth = 0;
  String cartMessage = '';

  @override
  void initState() {
    super.initState();
    print('ProductsPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;

    print(
      'ProductsPage: didChangeDependencies -> '
          'width: ${size.width}, height: ${size.height}',
    );
  }

  @override
  void deactivate() {
    print('ProductsPage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('ProductsPage: dispose');
    super.dispose();
  }

  Future<void> openProduct(int index) async {
    final product = products[index];

    // Navigator version - Part 2:
    // final result = await Navigator.push<String>(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProductDetailsPage(
    //       name: product['name'] as String,
    //       price: product['price'] as int,
    //     ),
    //   ),
    // );
    //
    // if (result != null) {
    //   setState(() {
    //     cartMessage = result;
    //   });
    // }

    final result = await context.push<String>(
      '/details/${Uri.encodeComponent(product["name"] as String)}/${product["price"]}',
    );

    if (!mounted) return;

    if (result != null) {
      setState(() {
        cartMessage = result;
      });
    }
  }

  void addFavorite() {
    setState(() {
      favorites++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ProductsPage: build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome ${widget.username}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Favorites: $favorites'),
                Text('Screen width: ${screenWidth.toStringAsFixed(1)}'),
                if (cartMessage.isNotEmpty)
                  Text(
                    cartMessage,
                    style: const TextStyle(color: Colors.green),
                  ),
              ],
            ),
          ),
          Expanded(
            child: screenWidth < 600
                ? ProductsListView(
              products: products,
              onFavoritePressed: addFavorite,
              onProductTap: openProduct,
            )
                : ProductsGridView(
              products: products,
              onFavoritePressed: addFavorite,
              onProductTap: openProduct,
            ),
          ),
        ],
      ),
    );
  }
}

