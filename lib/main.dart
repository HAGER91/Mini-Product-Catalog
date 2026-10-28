/*
Lifecycle Questions

1. When the page first opens:
initState(), didChangeDependencies(), and build() run in order.

2. After pressing the heart button:
setState() updates the favorites counter and build() runs again.

3. When leaving the page and going back:
deactivate() and dispose() run when a page is permanently removed.
When returning from Details to Products, the Products page usually remains in the stack.

4. When resizing the browser:
didChangeDependencies() runs when the screen size dependency changes,
and build() updates the layout using MediaQuery.sizeOf(context).
A width below 600 uses ListView; a width of 600 or more uses GridView.

go_router Questions

1. context.go() navigates to a destination, while context.push()
adds a page to the navigation stack.

2. We use go for Login to Products and push for Products to Details
because we want to return from Details and receive a result.

3. A path parameter is part of the path, for example /details/Shoes/40.
A query parameter follows ?, for example /products?user=Guest.
*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'login_page.dart';
import 'products_page.dart';
import 'product_details_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) {
        final username = state.uri.queryParameters['user'] ?? 'Guest';
        return ProductsPage(username: username);
      },
    ),
    GoRoute(
      path: '/details/:name/:price',
      name: 'details',
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? '';
        final price = int.tryParse(state.pathParameters['price'] ?? '') ?? 0;

        return ProductDetailsPage(
          name: name,
          price: price,
        );
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mini Product Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
