import 'package:flutter/material.dart';
import 'package:pixelplaymobile/screens/productentry_form.dart';
import 'package:pixelplaymobile/screens/menu.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; 

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Use the item's color for the background
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          String message = "";
          if (item.name == "View Product List") {
            message = "You have pressed the View Product List button";
          } else if (item.name == "Add Product") {
            message = "You have pressed the Add Product button";
          } else if (item.name == "Logout") {
            message = "You have pressed the Logout button";
          }
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(message)),
            );
          if (item.name == "View Product List") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          } else if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEntryFormPage(),
              ),
            );
          } else if (item.name == "Logout") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
