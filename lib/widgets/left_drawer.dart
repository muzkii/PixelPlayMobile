import 'package:flutter/material.dart';
import 'package:pixelplaymobile/screens/menu.dart';
import 'package:pixelplaymobile/screens/productentry_form.dart';
import 'package:pixelplaymobile/screens/list_productentry.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: const Column(
            children: [
              Text(
                'Pixel Play',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Your one-stop shop for gaming appliacnces is now on mobile!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Redirection part to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
              leading: const Icon(Icons.videogame_asset),
              title: const Text('Product List'),
              onTap: () {
                  // Route to the mood page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                  );
              },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add Product'),
            // Redirection part to AddItemFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductEntryFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}