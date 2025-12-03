
import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'pizza.dart';

// Praktikum 1: GET list + Singleton HttpHelper
void main() {
  runApp(const MyAppPraktikum1());
}

class MyAppPraktikum1 extends StatelessWidget {
  const MyAppPraktikum1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 1 – JSON by Hammam',
      theme: ThemeData(
        // Ganti warna tema sesuai selera
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePagePraktikum1(title: 'JSON – Praktikum 1'),
    );
  }
}

class MyHomePagePraktikum1 extends StatefulWidget {
  const MyHomePagePraktikum1({super.key, required this.title});

  final String title;

  @override
  State<MyHomePagePraktikum1> createState() => _MyHomePageStatePraktikum1();
}

class _MyHomePageStatePraktikum1 extends State<MyHomePagePraktikum1> {
  final HttpHelper helper = HttpHelper();
  late Future<List<Pizza>> _pizzasFuture;

  @override
  void initState() {
    super.initState();
    _pizzasFuture = helper.getPizzaList();
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = Colors.teal.shade700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON by Hammam – Praktikum 1'),
        backgroundColor: appBarColor,
      ),
      body: FutureBuilder<List<Pizza>>(
        future: _pizzasFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No pizzas found.'));
          }

          final List<Pizza> pizzas = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: pizzas.length,
            itemBuilder: (BuildContext context, int position) {
              final Pizza currentPizza = pizzas[position];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 6),
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade100,
                    child: Text(
                      currentPizza.pizzaName.isNotEmpty
                          ? currentPizza.pizzaName[0].toUpperCase()
                          : '?',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    currentPizza.pizzaName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${currentPizza.description} -  ${currentPizza.price?.toStringAsFixed(2) ?? 'N/A'}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
