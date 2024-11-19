# PixelPlay Mobile

An E-Commerce about Gaming Appliances created by Andriyo Averill Fahrezi with the ID of 2306172325. This is the mobile version of Pixel Play.

## Individual Assignment 7


### Creating a Flutter Project

First of all, we have to create a new Flutter project by doing:

1. Open Terminal or Powershell or Command Prompt.
2. Create a new directory and enter the directory for the Flutter project
3. _Generate_ a new Flutter project in the terminal with the name **pixelplaymobile**, then enter the project directory.
   
    ```bash
    flutter create pixelplaymobile
    cd pixelplaymobile
    ```

4. Run the project through Terminal, Powershell, or Command Prompt.

    ```bash
    flutter run
    ```

5. Choose one of the web browser to run the project, e.g. 2 for Chrome in my case

Now we have just succesfully created a new Flutter project.

### Reorganizing _Clean_ our Project

To make our project files easier to read, we separate our `main.dart` file with a new file `menu.dart`. We do as follows:

1. Create a new file name `menu.dart` to display the menus of our application in the `pixelplaymobile/lib/` directory. Next is to add an import statement `material.dart` to define the visual properties and behavior of widgets, such as buttons, text fields, and icons that we would want to use later in this assignment.
   
    ```dart
    import 'package:flutter/material.dart';
    ```

2. Now, inside our `main.dart` file, cut the lines from 39 to the end that contains the two classes below:

   ```dart
   class MyHomePage ... {
     ...
   }

   class _MyHomePageState ... {
     ...
   }
   ```

   Paste that to the file `menu.dart` that we have created previously.

3. By doing so, there would be an error on line 34, with the code:

     ```dart
     home: const MyHomePage(title: 'Flutter Demo Home Page'),
     ```

     This happens because inside the `main.dart` no longer have MyHomePage class, because we have moved it to another file, `menu.dart`. To solve this, we have to import the `menu.dart` file, in order to do so we can do as follows:

     ```dart
     import 'package:pixelplaymobile/menu.dart';
     ```

4. Now if we try to run the project again, it would still runs correctly

### Create Widget 
Now, to create three simple buttons with icons and texts we can follow these steps

#### Change the Application Theme

Now, I want to change the theme to match my Pixel Play Website and that is with the color orange and teal.

1. Open the `main.dart` file.
2. Change the code in the `main.dart` file in the application theme as follows:

     ```dart
     ...
     theme: ThemeData(
        // Set teal as the primary color and orange as the accent color
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.orange,  // Sets the accent color to orange
        ),
        scaffoldBackgroundColor: Colors.teal[50], // Light teal background for screens
        useMaterial3: true, // Optionally, use Material 3 design system
      ),
      ```

#### Change the Widget Page Menu to Stateless
1. In `main.dart` file, we have to remove `const MyHomePage(title: 'Flutter Demo Home Page')` and then add this code in the same line:

     ```dart
     ...
     ... MyHomePage(),
     ...
     ```

2. Now open `menu.dart` file, now we have to change the page so that it changes from stateful to stateless from:

     ```dart
     class MyHomePage extends StatefulWidget {
        const MyHomePage({super.key, required this.title});
      
        // This widget is the home page of your application. It is stateful, meaning
        // that it has a State object (defined below) that contains fields that affect
        // how it looks.
      
        // This class is the configuration for the state. It holds the values (in this
        // case the title) provided by the parent (in this case the App widget) and
        // used by the build method of the State. Fields in a Widget subclass are
        // always marked "final".
      
        final String title;
      
        @override
        State<MyHomePage> createState() => _MyHomePageState();
    ```

    To:

    ```dart
        class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
    
        @override
        Widget build(BuildContext context) {
    	return Scaffold(
    	    ... // do not copy this!
    	);
        }
    }
    ```

#### Now to Create Card with NPM, Name, Class

1. Before creating the card, we declare three variable of type string containing NPM, Name, and Class in the `class MyHomePage` in the `menu.dart` as follows:

     ```dart
    class MyHomePage extends StatelessWidget {
      final String npm = '2306172325'; // NPM
      final String name = 'Andriyo Averill Fahrezi'; // Name
      final String className = 'PBD'; // Class
    ```

2. Now we can create a new class named `InfoCard` still inside `menu.dart` file to make a simple card that will diplay the NPM, Name, and Class Information as follows:

     ```dart
     ...
     class InfoCard extends StatelessWidget {
      // Card information that displays the title and content.
    
      final String title;  // Card title.
      final String content;  // Card content.
    
      const InfoCard({super.key, required this.title, required this.content});
    
      @override
      Widget build(BuildContext context) {
        return Card(
          // Create a card box with a shadow.
          elevation: 2.0,
          child: Container(
            // Set the size and spacing within the card.
            width: MediaQuery.of(context).size.width / 3.5, // Adjust with the width of the device used.
            padding: const EdgeInsets.all(16.0),
            // Place the title and content vertically.
            child: Column(
              children: [
              Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(content),
              ],
            ),
          ),
        );
      }
     }
     ```

#### Creating a Button with Icon

1. Now, before we create a button, we can create a new class named `ItemHomepage` that contains the attributes of the card that we will create (name and icon). Inside the `menu.dart` file, do as follows:

      ```dart
      class ItemHomepage {
        final String name;
        final IconData icon;
      
        ItemHomepage(this.name, this.icon);
      }
      ...
      ```

2. After that, we can create a list of `ItemHomepage` that contains the buttons that we want to add to `MyHomepage` class. As follows:

      ```dart
      ...
      final List<ItemHomepage> items = [
          ItemHomepage("View Product List", Icons.list),
          ItemHomepage("Add Product", Icons.add),
          ItemHomepage("Logout", Icons.logout),
      ];
      ```
            
3. Now, we create the `ItemCard` class to display the button. Here, we display a `Snackbar` message, the button that is pressed will only display the snackbar message "You have pressed the **[button name]** button." We can do it as follows:

      ```dart
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
      ```

#### Adding Color to Our Button

1. To add color, we need to modify our `ItemHomepage` to have a class as the attribute. We can do as follows:


      ```dart
      class ItemHomepage {
          final String name;
          final IconData icon;
          final Color color; 
        
          ItemHomepage(this.name, this.icon, this.color);
      }
      ```

2. Next, we also need to modify the list of `ItemHomepage` that contains the buttons that we have modified earlier to the `MyHomePage` class

      ```dart
      ...
      final List<ItemHomepage> items = [
          ItemHomepage("View Product List", Icons.list, Colors.teal),
          ItemHomepage("Add Product", Icons.add, Colors.orange),
          ItemHomepage("Logout", Icons.logout, Colors.red),
      ];
      ...
      ```

#### Integrate InfoCard and ItemCard to Display on MyHomePage

Now, all we need to do is to integrate and display all the cards on `HomePage`, we can change the `Widget build()` section in the `MyHomePage` class. Because all UI elements (Widgets) in Flutter will be defined and built on the `Widget build()`. We can do it by adding the following code:

  ```dart
  class MyHomePage extends StatelessWidget {
    ...

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pixel Play',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: name),
                  InfoCard(title: 'Class', content: className),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to PixelPlayMobile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  ```

We have officially created our first Flutter mobile project!

### Answers to the Questions

1. **Stateless widgets and stateful widgets and the difference between them**

      Stateless widgets, are widgets that don't have any mutable state, hence the name stateless. They are immutable, meaning once they are built by the Widget build(), they can't change their appearance, data, or behavior. In other case, this is called static, it's best to use this when we have elements that don't change over time like icons, labels, etc. Meanwhile, a stateful widget are widgets that can change their state over time. They are associated with state object that can hold mutable data, changes during the widget's orientation. When the state is modified the widget re-renders to reflect any changes or updates. This is useful for interactive elements that rely on changes.

2. **The widgets that I have used for this project and its uses**

    -   **MaterialApp**: The root widget of the application, responsible for setting up themes, routing, and other stuff
    -   **Scaffold**: Provides a basic visual structure, including elements like `AppBar`, `Drawer`, `FloatingActionButton`. and a `body` where the main content goes
    -   **AppBar**: Displays a fixed header on top of the screen with title, action, or navigation buttons. 
    -   **Padding**: Adds spacing around or within widgets
    -   **Card**: Widget used for structured content blocks (like user info in `InfoCard`)
    -   **SnackBar**: A temporary message displayed at the bottom of the screen, triggered when users tap each button

3. **The use-case for `setState()` and variable that can be affected by `setState()`**

      Purpose of `setState()` is to update the UI in response to state changes in `SatatefulWidget`. When it is called, it signales that the widget's state has changes. Affected variables of `setState()` is whenever there is a class within the `State`. On the tutorial, there was a counter variable `{ _counter++; `, this would be updated by the `setState()`.

4. **Difference between `const` and `final` keywords**

      `const` used for values that are determined at compile-time and won't change, it is also immutable and initialzied with constant values. In this case, if a widget is created with `const`, it's considered constant and doesn't rebuild, optimizing our performance. While `final` is used for variables that are assigned once and can't be reassigned, hence the name, final, although their value can be determined at runtime. `final` variables are mutable before initialization and don't require any compile-time constants. So `const` is used to optimize performance, while `final` is used for assigning variables once without the need of compile-time values.

5. How I implemented the checklist above step-by-step

   Already answered on top of this section 🙏😁



## Individual Assignment 8

### Creating a Form Page

#### Input Elements (According to Django Project)

Currently, this is my Django `models.py`:

   ```python
   ...
   class Product(models.Model):
       user = models.ForeignKey(User, on_delete=models.CASCADE)
       id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
       name = models.CharField(max_length=100)
       price = models.IntegerField()
       description = models.TextField()
       category = models.CharField(max_length=50)
       stock = models.IntegerField()
       rating = models.DecimalField(max_digits=3, decimal_places=2, default=0)
   ...
   ```

Next is to change `models.py` that to a new form file, in order to do so we need to do as follows:

1. Open the `lib` directory and create a new file named `productentry_form.dart`. Here, we integrate our previous Django `models.py` as a dart file. We can do as follows:

      ```dart
      import 'package:flutter/material.dart';
      
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
        final TextEditingController _stockController = TextEditingController();
        final TextEditingController _ratingController = TextEditingController();
      
        
        @override
        Widget build(BuildContext context) {
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
            // WE SAVE THIS FOR LATER TO ADD THE DRAWER
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
                        controller: _stockController,
                        decoration: InputDecoration(
                          hintText: "Enter Product Stock",
                          labelText: "Product Stock",
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
                            return 'Product stock cannot be empty.';
                          }
                          final stock = int.tryParse(value);
                          if (stock == null || stock < 0) {
                            return 'Enter a valid non-negative integer for stock.';
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

    ```

      Here we have our `models.py` Django project in our Flutter project. I made some modifications including changing the previous model name of `stock` to `amount` because that is what the task told us to. Here we have a `TextEditingController` because we want to match the constraint of our text field to matches with the one in our Django project. It checks in the `validator` section of each input elements. Here we have the if statement `if (value == null || value.isEmpty)` to make it such that no input field is empty. We also have a `Back` button to `Pop` the stack everytime that we're accessing the form.

#### Redirect the User

2. Next is to integrate and redirect the user to the new item addition form when they press the `Add Item` button on the main page. First of all we need to import the newly created `productentry_form.dart` to our `menu.dart` file inside the `lib` directory. We can do it as follows:

   ```dart
   ...
   import 'package:pixelplaymobile/productentry_form.dart';
   ...
   ```

3. Underneath the `ScaffoldMessenger.of(context)` to show the `SnackBar` add these following codes:

   ```dart
   ...
      ...
         ...
            ...
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
         ...
      ...
   ...
   ```
      Here I also redirect other buttons to just go to the main page. Here, we use `Navigator.push` because we want to add that on top of the stack so that the user can press the `Back` button to go back to the homepage. Other than that, we use `Navigator.pushReplacement`.

#### Implement a Save Button to the Form and Display it in a Pop Up

5. First of all, we need to create a function to reset the form everytime that we want to make a save, we can do that by adding a function to reset the form and to dispose previous added items in the form. We can do that by adding these functions below the `final` statements:

   ```dart
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
   ```
   
6. To implement a save button to the form and display it in a pop up, we have to edit our `productentry_form.dart` file inside the `lib` directory. We can create it by using the `Align` to create an alignment widget to show the newly added product, with the option to click `Save` and click `OK` on the pop up message.

   ```dart
   ...
      ...
         ...
                Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Product has been successfully saved'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ${_nameController.text}'),
                                    Text('Price: ${_priceController.text}'),
                                    Text('Description: ${_descriptionController.text}'),
                                    Text('Category: ${_categoryController.text}'),
                                    Text('amount: ${_amountController.text}'),
                                    Text('Rating: ${_ratingController.text}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _resetForm();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ...
         ...
      ...
   ...
   ```
   
### Creating a Drawer

1. Inside the `lib` directory, create a new subdirectory with the name `widgets`, inside the current subdirectory, add a new file called `left_drawer.dart`. Inside that file, add these following code:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:pixelplaymobile/menu.dart';
   import 'package:pixelplaymobile/productentry_form.dart';
   
   
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
   ```

      Here, we have the drawer to use `Navigator.pushReplacement` redirect to the `MyHomePage` each time that the Home page button is pressed, and have it to `Navigator.push` to redirect to the `_ProductEntryFormPage`.

2. Next is to implement the drawer, to the `menu.dart` file and the `productentry_form.dart` . First of all we need to have import statements to both of our `menu.dart` file and `productentry_form.dart` file. With this import:

   ```dart
   ...
   import 'package:pixelplaymobile/widgets/left_drawer.dart';
   ```

      Now, we need to add the drawer to both of our files by having the line:

   ```dart
   ...
   drawer: const LeftDrawer(),
   ...
   ```


### File Refactoring 

Next, because it can be confusing for our files having that much file and unclear, we can do file refactoring to make our project clearer. We can do as follows:

1. Create a new file called `product_card.dart` inside the `lib/widgets` directory.

2. Move the contents of the `ItemHomepage` and `ItemCard` widgets by cut from `menu.dart` to `lib/widgets/product_card.dart`.

3. Don't forget to import the `productentry_form.dart` page in `product_card.dart` and import the `product_card.dart` page in `menu.dart`.

4. Create a new subdirectory named `screens` in the `lib` directory.

5. Move the `menu.dart` and `productentry_form.dart` files into the `screens` directory.

We have officially created a form page and a navigation bar to our Flutter project!

### Answers to the Questions

1. **Purpose of `const` in Flutter and when to use it**

      Just like how I answered on the previous assignment, `const` used for values that are determined at compile-time and won't change, it is also immutable and initialzied with constant values. In this case, if a widget is created with `const`, it's considered constant and doesn't rebuild, optimizing our performance.

      When to use `const`:
   
   -    Widgets and variables that do not change during the app's lifecycle
   -    Static content, such as text labels, static icons, and general layout structures that don't depend on variable changes or state

      When NOT to use `const`:
     
   -    When the widget or variable value is dynamic or depends on runtime data, such as user inputs

      
   
2. **Explanation and comparation of the usage Column and Row in Fltuter, with example implementations**

      `Column` and `Row` are two styles of layout widgets in Flutter than allow to arrange the widgets vertically by using `Column` or horizontally by using `Row`.

      `Column`
   
   - **Usage**: Arranges its children vertically in a single line
   - **Example**: Actually inside our Flutter project, on `productentry_form.dart`
     
      ```dart
      ...
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title"),
          TextFormField(),
          SizedBox(height: 10),
          Text("Description"),
          TextFormField(),
        ],
      )
      ```

   `Row`
     
   - **Usage**: Arranges its children horizontally in a single line
   - **Example**: Actually inside our Flutter project, on `main.dart`

        ```dart
        ...
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             InfoCard(title: 'NPM', content: npm),
             InfoCard(title: 'Name', content: name),
             InfoCard(title: 'Class', content: className),
           ],
         )
        ```

   Comparison of `Column` and `Row` is on the allignment options, they both provide alignment properties like `mainAxisAlignment` (allign along the main axis) and `crossAxisAlignment` (aligning across or perpendicular to axis).

3. **List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!**

   Input elements used in `productentry_form.dart` is **TextFormField**, for name,price,description, etc. Here its features are validation, hint for the text, and label for the text. Its use is to provide various customization options and input types for the user to interact.
   Other Flutter input elements not used are checkboxes, radios, dropdowns.

   Example of an unused input element:

      ```dart
      Checkbox(
        value: isSelected,
        onChanged: (bool? newValue) {
          setState(() {
            isSelected = newValue!;
          });
        },
      )
      ```


4. **How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?**

   We set the theme by setting a global theme to ensure its consistency. This is useful for defining colors in my case. I implemented it on `main.dart` with the main primary color to be teal and orange to be its secondary color.

      ```dart
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
              .copyWith(secondary: Colors.orange),
          scaffoldBackgroundColor: Colors.teal[50],
          useMaterial3: true,
        ),
      );
      ```

5. **How do you manage navigation in a multi-page Flutter application?**

   Flutter handles navigation by using the `Navigator` class, here we used `Navigator.push`, `Navigator.pushReplacement`, and `Navigator.pop`. I have used these navigations on my Flutter project as follows. On `product_card.dart` I used both `Navigator.push` and `Navigator.pushReplacement`, in this case, `Navigator.push` adds a new page on top of the current stack allowing users to navigate back to the previous page. Meanwhile, `Navigator.pushReplacement replaces the current apge with a new one, removing the rpevious page from the navigation stack.

      ```dart
      // Navigator.push example
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductEntryFormPage()),
      );

      // Navigator.pushReplacement example
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
      ```

## Individual Assignment 9

### Implement Django-Flutter Authentication Integration

#### Set Up Authentication Application in Django

We can set the authentication in Django by making a new application to handle our authentication in Flutter. So here are the step-by-step to do so:

1. Create an application by running `python manage.py startapp authentication` inside the Django Project Directory, in my case it is `PixelPlay/`
2. Since we have created an application, don't forget to add it into the `INSTALLED_APPS` section inside the `settings.py` of our project directory.
3. Now since we want to integrate our Flutter, we need to install some library first, so in the project directory, run `env/Scripts/activate` to run virtual environment, then execute `pip install django-cors-headers`. Now `django-cors-headers` is a Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS).
4. Add `corsheaders` to `INSTALLED_APPS` in the `settings.py` of our project directory.
5. Add `corsheaders.middleware.CorsMiddleware` to the `MIDDLEWARE` section inside the `settings.py` of our project directory.
6. Add the following code snippets of variables to the `settings.py` of our project directory as follows:

      ```python
      CORS_ALLOW_ALL_ORIGINS = True
      CORS_ALLOW_CREDENTIALS = True
      CSRF_COOKIE_SECURE = True
      SESSION_COOKIE_SECURE = True
      CSRF_COOKIE_SAMESITE = 'None'
      SESSION_COOKIE_SAMESITE = 'None'
      ```
      
7. In case of using Android Emulator, we need to add the host of our `flutter run` by adding `10.0.2.2` to `ALLOWED_HOSTS` inside the `settings.py` file of our project directory

      ```python
      ALLOWED_HOSTS = [..., ..., "10.0.2.2"]
      ```
      
#### Integrate Authentication in Flutter

1. Install packages e.g. `flutter pub add provider` and `flutter pub add pbp_django_auth`

2. Change the `main.dart` to handle `CookieRequest` using the `Provider` library. We can change `main.dart` as follows:

      ```dart
      import 'package:flutter/material.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';
      
      void main() {
        runApp(const MyApp());
      }
      
      class MyApp extends StatelessWidget {
        const MyApp({super.key});
      
        @override
        Widget build(BuildContext context) {
          return Provider(
            create: (_) {
              CookieRequest request = CookieRequest();
              return request;
            },
            child: MaterialApp(
              title: 'PixelPlayMobile',
              theme: ThemeData(
                // Set teal as the primary color and orange as the accent color
                primarySwatch: Colors.teal,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.teal,
                ).copyWith(
                  secondary: Colors.orange,  // Sets the accent color to orange
                ),
                scaffoldBackgroundColor: Colors.teal[50], // Light teal background for screens
                useMaterial3: true, // Optionally, use Material 3 design system
              ),
              home: LoginPage(),
            ),
          );
        }
      }
      ```
      
#### Implement Login View

1. Inside the `authentication` directory. Add the following code to the `views.py` file as follows:

      ```python
      @csrf_exempt
      def login(request):
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
          if user is not None:
              if user.is_active:
                  auth_login(request, user)
                  # Successful login status.
                  return JsonResponse({
                      "username": user.username,
                      "status": True,
                      "message": "Login successful!"
                      # Add other data if you want to send data to Flutter.
                  }, status=200)
              else:
                  return JsonResponse({
                      "status": False,
                      "message": "Login failed, account disabled."
                  }, status=401)
      
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login failed, check email or password again."
              }, status=401)
      ```

2. In the same directory, create a `urls.py` file to handle all the URL routing to the function that we have made on `views.py`. Add the following code:

      ```python
      from django.urls import path
      from authentication.views import login
      
      app_name = 'authentication'
      
      urlpatterns = [
          path('login/', login, name='login'),
      ]
      ```
      
3. Since we have made a `urls.py` of our `authentication` app, don't forget to add it to the `urls.py` of our project directory, in this case is `PixelPlay/urls.py`, add the corresponding path to `urlpatterns`:

      ```python
      ...
      urlpatterns = [
         ...
         path('auth/', include('authentication.urls')),
      ]
      ```
      

#### Implement Login Page
4. Create a new file in the `screens` folder named `login.dart`. And then copy paste this code into `login.dart` as follows:

      ```dart
      import 'package:pixelplaymobile/screens/menu.dart';
      import 'package:flutter/material.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';
      
      
      void main() {
        runApp(const LoginApp());
      }
      
      class LoginApp extends StatelessWidget {
        const LoginApp({super.key});
      
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                // Set teal as the primary color and orange as the accent color
                primarySwatch: Colors.teal,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.teal,
                ).copyWith(
                  secondary: Colors.orange,  // Sets the accent color to orange
                ),
                scaffoldBackgroundColor: Colors.teal[50], // Light teal background for screens
                useMaterial3: true, // Optionally, use Material 3 design system
              ),
            home: const LoginPage(),
          );
        }
      }
      
      class LoginPage extends StatefulWidget {
        const LoginPage({super.key});
      
        @override
        State<LoginPage> createState() => _LoginPageState();
      }
      
      class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();
      
        @override
        Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
      
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () async {
                            String username = _usernameController.text;
                            String password = _passwordController.text;
      
      		  // Check credentials
      		  // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
      		  // To connect the Android emulator to Django on localhost,
      		  // use the URL http://10.0.2.2/
                            final response = await request
                                .login("http://localhost:8000/auth/login/", {
                              'username': username,
                              'password': password,
                            });
      
                            if (request.loggedIn) {
                              String message = response['message'];
                              String uname = response['username'];
                              if (context.mounted) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("$message Welcome, $uname.")),
                                  );
                              }
                            } else {
                              if (context.mounted) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Login Failed'),
                                    content: Text(response['message']),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 36.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          child: Text(
                            'Don\'t have an account? Register',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
      ```

5. In the `main.dart` file, don't forget to add the login page import statement as :

      ```dart
      ...
      import 'package:pixelplaymobile/screens/login.dart';
      ...
      ```

      Because we are directing the user to the `LoginPage()` when they first go to our application

#### Implement Register View

1. Inside the `authentication` directory. Add the following code to the `views.py` file as follows:

      ```python
      ...
      from django.contrib.auth.models import User
      import json
      ...
      
      @csrf_exempt
      def register(request):
          if request.method == 'POST':
              data = json.loads(request.body)
              username = data['username']
              password1 = data['password1']
              password2 = data['password2']
      
              # Check if the passwords match
              if password1 != password2:
                  return JsonResponse({
                      "status": False,
                      "message": "Passwords do not match."
                  }, status=400)
      
              # Check if the username is already taken
              if User.objects.filter(username=username).exists():
                  return JsonResponse({
                      "status": False,
                      "message": "Username already exists."
                  }, status=400)
      
              # Create the new user
              user = User.objects.create_user(username=username, password=password1)
              user.save()
      
              return JsonResponse({
                  "username": user.username,
                  "status": 'success',
                  "message": "User created successfully!"
              }, status=200)
      
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Invalid request method."
              }, status=400)
      ```

2. In the same directory, add these path in `urls.py` file to handle the URL routing to the register function that we have made on `views.py`. Add the following code:

      ```python
      from authentication.views import login, register  # add "register" to this line
      ...
      path('register/', register, name='register'),
      ```
      
3. Since we have made a `urls.py` of our `authentication` app, don't forget to add it to the `urls.py` of our project directory, in this case is `PixelPlay/urls.py`, add the corresponding path to `urlpatterns`:

      ```python
      ...
      urlpatterns = [
         ...
         path('auth/', include('authentication.urls')),
      ]
      ```

#### Implement Register Page

4. Create a new file in the `screens` folder named `register.dart`. And then copy paste this code into `register.dart` as follows:

      ```dart
      import 'dart:convert';
      import 'package:flutter/material.dart';
      import 'package:pixelplaymobile/screens/login.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:provider/provider.dart';
      
      class RegisterPage extends StatefulWidget {
        const RegisterPage({super.key});
      
        @override
        State<RegisterPage> createState() => _RegisterPageState();
      }
      
      class _RegisterPageState extends State<RegisterPage> {
        final _usernameController = TextEditingController();
        final _passwordController = TextEditingController();
        final _confirmPasswordController = TextEditingController();
      
        @override
        Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () async {
                            String username = _usernameController.text;
                            String password1 = _passwordController.text;
                            String password2 = _confirmPasswordController.text;
      
                            // Check credentials
                            // TODO: Change the url, don't forget to add a slash (/) inthe end of the URL!
                            // To connect Android emulator with Django on localhost,
                            // use the URL http://10.0.2.2/
                            final response = await request.postJson(
                                "http://localhost:8000/auth/register/",
                                jsonEncode({
                                  "username": username,
                                  "password1": password1,
                                  "password2": password2,
                                }));
                            if (context.mounted) {
                              if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Successfully registered!'),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to register!'),
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
      ```

5. In the `main.dart` file, don't forget to add the login page import statement as :

      ```dart
      ...
      import 'package:pixelplaymobile/screens/login.dart';
      ...
      ```

      Because we are directing the user to the `LoginPage()` when they first go to our application


We have successfully implemented Login, Register, and authentication on our Django-Flutter project!

### Create Custom Model (According to Django Project)

1. To create a model of our Django project, we can use the JSON data that we used. We can use [Quicktype](http://app.quicktype.io/) website. In order to do so we can run our Django project first by using `python manage.py runserver`
2. Copy the `JSON` endpoint by login in first to the website, then copy the resulted `JSON` from `http://localhost:8000/json/`
3. Paste the previously copied `JSON` data into the textbox on Quicktype, then change the _setup name_ to `ProductEntry`, _source type_ `JSON`, and language to `Dart`
4. Click the `Copy Code` on Quicktype
5. Now go to the `lib` directory of our Flutter project, create a new subdirectory inside the `lib` directory named `models`. Now inside the `lib/models/` directory create a dart file named `product_entry.dart`, and paste the copied code from Quicktype. As follows:

      ```dart
      // To parse this JSON data, do
      //
      //     final productEntry = productEntryFromJson(jsonString);
      
      import 'dart:convert';
      
      List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));
      
      String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
      
      class ProductEntry {
          String model;
          String pk;
          Fields fields;
      
          ProductEntry({
              required this.model,
              required this.pk,
              required this.fields,
          });
      
          factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
              model: json["model"],
              pk: json["pk"],
              fields: Fields.fromJson(json["fields"]),
          );
      
          Map<String, dynamic> toJson() => {
              "model": model,
              "pk": pk,
              "fields": fields.toJson(),
          };
      }
      
      class Fields {
          int user;
          String name;
          int price;
          String description;
          String category;
          int stock;
          String rating;
      
          Fields({
              required this.user,
              required this.name,
              required this.price,
              required this.description,
              required this.category,
              required this.stock,
              required this.rating,
          });
      
          factory Fields.fromJson(Map<String, dynamic> json) => Fields(
              user: json["user"],
              name: json["name"],
              price: json["price"],
              description: json["description"],
              category: json["category"],
              stock: json["stock"],
              rating: json["rating"],
          );
      
          Map<String, dynamic> toJson() => {
              "user": user,
              "name": name,
              "price": price,
              "description": description,
              "category": category,
              "stock": stock,
              "rating": rating,
          };
      }
      ```

### Fetch Data at the JSON Endpoint

#### Add HTTP Dependency

1. Run `flutter pub add http` in your Flutter project terminal to add the `http` package.

2. In the file `android/app/src/main/AndroidManifest.xml`, add this code to allow your Flutter app to access the internet.

      ```xml
      ...
          <application>
          ...
          </application>
          <!-- Required to fetch data from the Internet. -->
          <uses-permission android:name="android.permission.INTERNET" />
      ...
      ```

#### Fetch Data

1. Inside the `screens` subdirectory on the `lib` directory, create a new file named `list_productentry.dart`. Here we would display the `name`, `price`, and `description` only.
2. In the `list_productentry.dart`, we can add our product as follows:

      ```dart
      import 'package:flutter/material.dart';
      import 'package:pixelplaymobile/models/product_entry.dart';
      import 'package:pixelplaymobile/widgets/left_drawer.dart';
      import 'package:pixelplaymobile/screens/product_detail.dart';
      import 'package:provider/provider.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
   
      class ProductEntryPage extends StatefulWidget {
        const ProductEntryPage({super.key});
      
        @override
        State<ProductEntryPage> createState() => _ProductEntryPageState();
      }
      
      class _ProductEntryPageState extends State<ProductEntryPage> {
        Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
          final response = await request.get('http://localhost:8000/json/');
      
          var data = response;
      
          List<ProductEntry> listProducts = [];
          for (var d in data) {
            if (d != null) {
              listProducts.add(ProductEntry.fromJson(d));
            }
          }
          return listProducts;
        }
      
        @override
        Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Product Entry List'),
              
            ),
      
            drawer: const LeftDrawer(),
            body: FutureBuilder(
              future: fetchProducts(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          'There is no product data available.',
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        final product = snapshot.data![index];
                        return InkWell(
                          onTap: () {
                            // Navigate to the detail page when a product is tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(product: product),
                              ),
                            );
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.fields.name,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("Price: \$${product.fields.price}"),
                                const SizedBox(height: 10),
                                Text("Description: ${product.fields.description}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          );
        }
      }
      ```

3. We would implement the `product_detail.dart` later, for now, we would add the `list_productentry.dart` to the `left_drawer.dart` file inside the `widgets` subdirectory. We can add these code as follows:

      ```dart
      ...
      import 'package:pixelplaymobile/screens/list_productentry.dart';
      ...
      ...
      //Other List Tiles
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
      ...
      ```
4. Change the `View Product List` in the `product_card.dart` file in the `widgets` subdirectory. We can add the redirection by adding an `else if` statement as follows:

      ```dart
      ...
      import 'package:pixelplaymobile/screens/list_productentry.dart';  
      import 'package:provider/provider.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:pixelplaymobile/screens/login.dart';
      ...
      if (item.name == "View Product List") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProductEntryPage(),
              ),
            );
      } ...
      ```

### Integrate Django-Flutter Form 

#### Creating a Create Product Flutter View in Django

1. Inside the `views.py` of our Django `main` application. Add the following code:

      ```python
      ...
      import json 

      @csrf_exempt # Assignment 9
      def create_product_flutter(request):
          if request.method == 'POST':
      
              data = json.loads(request.body)
      
              new_product = Product.objects.create(
              user=request.user,
              name=data['name'],
              price=data['price'],
              description=data['description'],
              category=data['category'],
              stock=data['amount'],
              rating=data['rating']
              )
              new_product.save()
      
              return JsonResponse({"status": "success"}, status=200)
          else:
              return JsonResponse({"status": "error"}, status=401)
      ```

2. Because we have created a view inside the `views.py`, don't forget to add the path inside the `urls.py` of the same directory as follows:

      ```python
      ...
      from main.views import ..., create_product_flutter
      ...

      urlpatterns = [
         ...
         path('create-product-flutter/', create_product_flutter, name='create_product_flutter')
      ]
      ```
      
#### Connecting Django to our Flutter Project

3. Now connect the page `productentry_form.dart` to handle `CookieRequest` by adding the following code:

      ```dart

      ...
      @override
      Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
      
          return Scaffold(
          ...
      ```
      
4. Now, we can change the `onPressed: ()` button in the same file to save the form as follows:

      ```dart
      ...
      import 'package:provider/provider.dart';
      import 'package:pixelplaymobile/screens/menu.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'dart:convert';

      ...
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
      ...
      ```

### Create a Detail Page

1. Continuing the `Fetch Data` section, we can implement the product details in this section. Inside the `screens` subdirectory, create a new file named `product_detail.dart`. Fill in the file with the code as follows:

      ```dart
      import 'package:flutter/material.dart';
      import 'package:pixelplaymobile/models/product_entry.dart';
      
      class ProductDetailPage extends StatelessWidget {
        final ProductEntry product;
      
        const ProductDetailPage({super.key, required this.product});
      
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Product Details"),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.teal.shade300, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Header
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            product.fields.category.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
      
                      // Product Details
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Text(
                              product.fields.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Price
                            Text(
                              "Price: \$${product.fields.price}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Description
                            Text(
                              "Description: ${product.fields.description}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Stock and Rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Rating
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: double.parse(product.fields.rating) > 4.5
                                          ? Colors.yellow
                                          : Colors.grey,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "Rating: ${product.fields.rating}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                // Stock
                                Text(
                                  "Stock: ${product.fields.stock}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: product.fields.stock > 0
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Back Button
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Back to Product List",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }
      ```

      In this case, we implemented so that if the user tap item on the Product list page, it would pop up all the remaining attributes of our item model. We also implemented a button to return to the item list page

### Logout 

#### Create a Logout View

1. Inside the `views.py` of the `authentication` app in our Django project. Add the following code:

      ```python
      ...
      from django.contrib.auth import ... , logout as auth_logout
      ...
      
      @csrf_exempt
      def logout(request):
          username = request.user.username
      
          try:
              auth_logout(request)
              return JsonResponse({
                  "username": username,
                  "status": True,
                  "message": "Logged out successfully!"
              }, status=200)
          except:
              return JsonResponse({
              "status": False,
              "message": "Logout failed."
              }, status=401)
      ```

2. Don't forget to add a new path in the `urls.py` file on the same directory as follows:

      ```python
      ...
      from authentication.views import ..., logout
      ...
      urlpatterns = [
         ...
         path('logout/', logout, name='logout'),
      ]
      ```

#### Filter Item List Page

3. Inside the `product_card.dart` file, we can filter out the item by using cookies, part of using the logout process to be asynchronously. We can add `final request = context.watch<CookieRequest>();` before `return Material()`. So our final `product_card.dart` would be:

      ```dart
      import 'package:flutter/material.dart';
      import 'package:pixelplaymobile/screens/productentry_form.dart';
      import 'package:pixelplaymobile/screens/list_productentry.dart';  
      import 'package:provider/provider.dart';
      import 'package:pbp_django_auth/pbp_django_auth.dart';
      import 'package:pixelplaymobile/screens/login.dart';
      
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
          final request = context.watch<CookieRequest>();
          return Material(
            color: item.color, // Use the item's color for the background
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () async {
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
                      builder: (context) => ProductEntryPage(),
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
                  final response = await request.logout(
                    'http://localhost:8000/auth/logout/');
                  String message = response["message"];
                  if (context.mounted) {
                      if (response['status']) {
                          String uname = response["username"];
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$message Goodbye, $uname."),
                          ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                      } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(message),
                              ),
                          );
                      }
                  }
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
      ```

We have successfully implemented login, register, authentication, integrating our Flutter project with Django project, create a model, create a new item list page, and handle cookies for our application!

### Answers to the Questions

1. **Explain why we need to create a model to retrieve or send JSON data. Will an error occur if we don't create a model first?**

   **Purpose of a Model:**

      A model is a representation of the structure of the JSON data in the application. It acts as a bridge between the raw JSON data and how it is manipulated in the app. Models help:

      - **Organize Data**: Provide a clear structure for parsing incoming JSON or formatting data to be sent as JSON
      - **Validation**: Ensure that data follows the expected format (e.g., required fields, types)
      - **Code Reusability**: Avoid repetitive JSON parsing/serialization logic in multiple places

   **If a Model Is Not Created:**

      An error might not occur immediately, but managing JSON data without a model becomes complex:

      - **Manual Parsing**: You’ll need to use raw Map<String, dynamic> everywhere, making the code verbose and error-prone
      - **Runtime Errors**: Mistyped field names or incorrect types could cause runtime exceptions
      - **Maintenance Issues**: Without models, code becomes harder to read, maintain, and debug

2. **Explain the function of the http library that you implemented for this task!**

   The `http` library in Flutter enables the app to interact with web APIs via HTTP methods (`GET`, `POST`, `PUT`, `DELETE`)

   **Functions of `http` Library:**
   
      1.  **Sending Requests**: Allows sending HTTP requests (e.g., fetching product data from a server)
      2.  **Receiving Responses**: Provides the HTTP response, including status codes (e.g., 200 for success) and body content
      3.  **Interpreting Data**: Converts raw JSON responses into usable data formats

   Example:
   
      `final response = await request.get('http://localhost:8000/json/');`

      This fetches the product data from the localhost server
   
3. **Explain the function of `CookieRequest` and why it’s necessary to share the `CookieRequest` instance with all components in the Flutter app.**

   `CookieRequest` is a utility that manages authenticated sessions with a Django backend. It helps maintain the state of the user's session across multiple requests

   **Functions of `CookieRequest`:**
   
      1. **Session Management**: Automatically handles cookies to persist login sessions. For example, when a user logs in, the session ID is stored and sent with subsequent requests
      2. **Simplifies Requests**: Wraps the http library to add authentication headers (e.g., cookies) transparently
      3. **Shared Instance**: Ensures a single instance of CookieRequest is used throughout the app, avoiding redundant login/logout operations

   **Why Share `CookieRequest` Across Components?**
   
      - The `CookieRequest` instance ensures all requests share the same session data, such as authentication cookies
      - Without a shared instance, components might lose track of session data, forcing repeated logins or causing inconsistent behavior


4. **Explain the mechanism of data transmission, from input to display in Flutter!**

   The mechanism of data flow, from input to display, can be arranged to these steps:

   1. **Input (User Interaction):**

      Users provide input through widgets like `TextFormField` (e.g., entering product details)

   2. **Validation:**

      Input is validated locally in Flutter using form validators

      Example:

         ```dart
         if (_formKey.currentState!.validate()) {
           // Proceed to submit data
         }
         ```
         
   3. **Data Submission:**

      Data is serialized into JSON and sent to the Django backend via `POST` using `CookieRequest`:

         ```dart
         final response = await request.postJson(
           "http://localhost:8000/create-product-flutter/",
           jsonEncode(data),
         );
         ```
         
   4. Server Processing:

      Django processes the request, validates the data, and performs the necessary actions (e.g., saving to the database)

   5. Response and Display:

      - The server responds with a JSON payload (e.g., success or error messages)
      - Flutter parses the response and updates the UI accordingly (e.g., showing a Snackbar or navigating to the product list)
        
5. **Explain the authentication mechanism from login, register, to logout. Start from inputting account data in Flutter to Django’s completion of the authentication process and display of the menu in Flutter!**

   The authentication mechanism involves the login, register, and logout processes

   **1. Registration:**

      a. Flutter:
   
      - User enters details (e.g., username, password) in a registration form
      - Data is sent via `POST` to Django

      Example:
      ```dart
      final response = await request.postJson(
        "http://localhost:8000/register/",
        jsonEncode(data),
      );
      ```
      
      b. Django:
   
      - Validates the input and creates a new user in the database using `User.objects.create_user`
   
      c. Response:

      - Returns success or error status to Flutter, which updates the UI accordingly (e.g., "Registration Successful")

   **2. Login:**

      a. Flutter:
   
      - User enters credentials (username, password) in a login form
      - Credentials are sent to Django via `POST` using `CookieRequest`
        
      Example:
      ```dart
      final response = await request.postJson(
        "http://localhost:8000/login/",
        jsonEncode({'username': username, 'password': password}),
      );
      ```
      
      b. Django:

      - Verifies credentials using `authenticate()` and logs the user in, creating a session
      - The session ID is stored in cookies and sent back to Flutter
      
      c. Flutter:

      - Stores the session using CookieRequest, ensuring the user remains logged in across app components
        
   **3. Logout:**

      a. Flutter:

      - Sends a `GET` or `POST` request to Django’s logout endpoint:

      Example:
      ```dart
      await request.get("http://localhost:8000/logout/");
      ```
      
      b. Django:

      - Deletes the session and invalidates the cookie

      c. Flutter:

      - Clears the local CookieRequest session and redirects to the login screen

      **Authentication Workflow (Input to Completion):**
   
      1. Input: User provides login or registration details
      2. Transmission: Data is sent to Django
      3. Backend Logic: Django verifies the data, handles session management, and returns a response
      4. Display: Flutter updates the UI (e.g., navigates to the home page on successful login)
   
5. **Explain how you implement the checklist above step by step! (not just following the tutorial)**

      Already answered on top of this section 🙏😁
      
