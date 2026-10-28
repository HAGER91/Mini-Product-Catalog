import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final int price;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  State<ProductDetailsPage> createState() {
    return ProductDetailsPageState();
  }
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    print('ProductDetailsPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ProductDetailsPage: didChangeDependencies');
  }

  @override
  void deactivate() {
    print('ProductDetailsPage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('ProductDetailsPage: dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('ProductDetailsPage: build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.shopping_bag,
                size: 90,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: \$${widget.price}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator version - Part 2:
                    // Navigator.pop(context, '${widget.name} added to cart');

                    context.pop('${widget.name} added to cart');
                  },
                  child: const Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
