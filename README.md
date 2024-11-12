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

      

