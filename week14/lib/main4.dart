import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'pizza.dart';
import 'pizza_detail.dart';

// Praktikum 4: Full CRUD list + POST/PUT + DELETE (Dismissible)
void main() {
  runApp(const MyAppPraktikum4());
}

class MyAppPraktikum4 extends StatelessWidget {
  const MyAppPraktikum4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 4 – JSON by Hammam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePagePraktikum4(title: 'JSON – Praktikum 4'),
    );
  }
}

class MyHomePagePraktikum4 extends StatefulWidget {
  const MyHomePagePraktikum4({super.key, required this.title});

  final String title;

  @override
  State<MyHomePagePraktikum4> createState() => _MyHomePageStatePraktikum4();
}

class _MyHomePageStatePraktikum4 extends State<MyHomePagePraktikum4> {
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
        title: const Text('JSON by Hammam – Praktikum 4 (DELETE)'),
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

              return Dismissible(
                key: Key(currentPizza.id?.toString() ?? currentPizza.pizzaName),
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) async {
                  if (currentPizza.id != null) {
                    await helper.deletePizza(currentPizza.id!);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${currentPizza.pizzaName} dismissed (API DELETE called)',
                      ),
                    ),
                  );
                  _refreshList();
                },
                child: Card(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PizzaDetailScreen(
                            pizza: currentPizza,
                            isNew: false,
                          ),
                        ),
                      ).then((_) => _refreshList());
                    },
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
