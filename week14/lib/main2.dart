import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'pizza.dart';
import 'pizza_detail.dart';

// Praktikum 2: GET list + POST (FloatingActionButton -> PizzaDetailScreen isNew=true)
void main() {
  runApp(const MyAppPraktikum2());
}

class MyAppPraktikum2 extends StatelessWidget {
  const MyAppPraktikum2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 2 – JSON by Hammam',
      theme: ThemeData(
        // Sama seperti Praktikum 1 (hijau/teal)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePagePraktikum2(title: 'JSON – Praktikum 2'),
    );
  }
}

class MyHomePagePraktikum2 extends StatefulWidget {
  const MyHomePagePraktikum2({super.key, required this.title});

  final String title;

  @override
  State<MyHomePagePraktikum2> createState() => _MyHomePageStatePraktikum2();
}

class _MyHomePageStatePraktikum2 extends State<MyHomePagePraktikum2> {
  final HttpHelper helper = HttpHelper();
  late Future<List<Pizza>> _pizzasFuture;

  @override
  void initState() {
    super.initState();
    _pizzasFuture = helper.getPizzaList();
  }

  void _refreshList() {
    setState(() {
      _pizzasFuture = helper.getPizzaList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = Colors.teal.shade700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON by Hammam – Praktikum 2 (POST)'),
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${currentPizza.description} - € ${currentPizza.price?.toStringAsFixed(2) ?? 'N/A'}',
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(
                  pizzaName: '',
                  description: '',
                ),
                isNew: true,
              ),
            ),
          ).then((_) => _refreshList());
        },
      ),
    );
  }
}
