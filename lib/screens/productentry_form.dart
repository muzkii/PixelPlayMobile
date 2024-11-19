import 'package:flutter/material.dart';
import 'package:pixelplaymobile/screens/menu.dart';
import 'package:pixelplaymobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _amountController.clear();
    _ratingController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _amountController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Gaming Product',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Product Name",
                    labelText: "Product Name",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  maxLength: 100,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product name cannot be empty.';
                    }
                    if (value.length > 100) {
                      return 'Product name cannot exceed 100 characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    hintText: "Enter Product Price",
                    labelText: "Product Price",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product price cannot be empty.';
                    }
                    final price = int.tryParse(value);
                    if (price == null || price < 0) {
                      return 'Enter a valid positive integer for price.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: "Enter Product Description",
                    labelText: "Product Description",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  maxLength: 250,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product description cannot be empty.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    hintText: "Enter Product Category",
                    labelText: "Product Category",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  maxLength: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product category cannot be empty.';
                    }
                    if (value.length > 50) {
                      return 'Product category cannot exceed 50 characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    hintText: "Enter Product amount",
                    labelText: "Product amount",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product amount cannot be empty.';
                    }
                    final amount = int.tryParse(value);
                    if (amount == null || amount < 0) {
                      return 'Enter a valid non-negative integer for amount.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _ratingController,
                  decoration: InputDecoration(
                    hintText: "Enter Product Rating",
                    labelText: "Product Rating",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product rating cannot be empty.';
                    }
                    final rating = double.tryParse(value);
                    if (rating == null || rating < 0 || rating > 5) {
                      return 'Enter a valid rating between 0 and 5.';
                    }
                    if (value.contains('.') && value.split('.').last.length > 2) {
                      return 'Rating can have a maximum of 2 decimal places.';
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            // Send request to Django and wait for the response
                            // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                            final response = await request.postJson(
                                "http://localhost:8000/create-product-flutter/",
                                jsonEncode(<String, String>{
                                    'name': _nameController.text,
                                    'price': _priceController.text,
                                    'description': _descriptionController.text,
                                    'category': _categoryController.text,
                                    'amount': _amountController.text,
                                    'rating': _ratingController.text,
                                // TODO: Adjust the fields with your project
                                }),
                            );
                            if (context.mounted) {
                                if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                    content: Text("New product has saved successfully!"),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content:
                                            Text("Something went wrong, please try again."),
                                    ));
                                }
                            }
                        }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}