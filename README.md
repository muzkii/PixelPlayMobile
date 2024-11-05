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


     







      
  
