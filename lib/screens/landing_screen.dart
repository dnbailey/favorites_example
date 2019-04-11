import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 160.0,
          horizontal: 70.0,
        ),
        child: Column(
          // Center everything
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // Display all the buttons and heading
          children: <Widget>[
            buildHeader(),
            buildRaisedButton(context, title: "Favorites", route: '/favs'),
            buildRaisedButton(context, title: "ListA", route: '/lista'),
            buildRaisedButton(context, title: "ListB", route: '/listb'),
            buildRaisedButton(context, title: "ListC", route: '/listc'),
          ],
        ),
      ),
    );
  }

  // Title for the app
  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Text(
        "Favorites Example",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Buttons to navigate to different screens
  RaisedButton buildRaisedButton(
    BuildContext context, {
    String title,
    String route,
  }) {
    return RaisedButton(
      // Navigate when pressed
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
