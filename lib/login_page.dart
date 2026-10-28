import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('LoginPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('LoginPage: didChangeDependencies');
  }

  @override
  void deactivate() {
    print('LoginPage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('LoginPage: dispose');
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('LoginPage: build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Welcome to Shopping App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final username = nameController.text.trim().isEmpty
                        ? 'Guest'
                        : nameController.text.trim();

                    // Navigator version - Part 2:
                    // Navigator.pushNamed(
                    //   context,
                    //   '/products',
                    //   arguments: username,
                    // );

                    context.goNamed(
                      'products',
                      queryParameters: {'user': username},
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
