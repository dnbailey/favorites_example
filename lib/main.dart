import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_example/data/lists.dart';
import 'package:scoped_example/models/favorites_model.dart';
import 'package:scoped_example/screens/favorites_screen.dart';
import 'package:scoped_example/screens/landing_screen.dart';
import 'package:scoped_example/screens/list_screen.dart';

// Pass the favorite model to the app
void main() => runApp(MyApp(model: FavoritesModel()));

class MyApp extends StatelessWidget {
  // Local Vartiabls
  final FavoritesModel model; // Local instance of model
  final String title = "Favorites Example";

  // Constructor for MyApp
  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provide access to the model at the top of the widget tree
    return ScopedModel<FavoritesModel>(
      // Set the model property to the local instance
      model: model,
      child: MaterialApp(
        title: title,
        theme: buildThemeData(),
        initialRoute: '/',
        routes: routes(),
      ),
    );
  }

  // Theme
  ThemeData buildThemeData() {
    return ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
        )
        // primaryColor: Colors.black,
        );
  }

  // Routes
  Map<String, WidgetBuilder> routes() {
    return {
      // Landing page with navigation to other screens
      '/': (context) => LandingScreen(),

      // Build the list of favorites based on the model
      '/favs': (context) => FavoritesScreen(),

      // Build the list screens based on the initial data
      '/lista': (context) => ListScreen(title: "List A", list: listA),
      '/listb': (context) => ListScreen(title: "List B", list: listB),
      '/listc': (context) => ListScreen(title: "List C", list: listC),
    };
  }
}
