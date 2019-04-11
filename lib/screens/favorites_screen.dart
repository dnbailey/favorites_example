import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_example/models/favorites_model.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Give the list access to the model
    return ScopedModelDescendant<FavoritesModel>(
      builder: (context, child, model) {
        return Scaffold(
          appBar: buildAppBar(context, model),
          // Show a different message if the favorites list is empty
          body: model.favorites.isEmpty
              ? buildEmptyList(model)
              : buildFavoritesList(model),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context, FavoritesModel model) {
    return AppBar(
      title: Text('Favorites'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.clear_all),
          tooltip: "Clear all favorites",
          onPressed: () => _showDialog(context, model),
        ),
      ],
    );
  }

  Widget buildEmptyList(FavoritesModel model) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          "No favorites right now.\n Why don't you pick a few.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildFavoritesList(FavoritesModel model) {
    return ListView.builder(
      itemCount: model.favorites.length,
      itemBuilder: (context, index) => ListTile(
            title: Text(model.favorites[index]),
            trailing: IconButton(
              onPressed: () => model.toggleFavorite(model.favorites[index]),
              icon: Icon(Icons.favorite),
            ),
          ),
    );
  }

  // Comfirm that the user wants to clear the favorites list
  void _showDialog(BuildContext context, FavoritesModel model) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Clear All Favorites?"),
          content:
              Text("Are you sure you want to clear all of your favorites?"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          actions: <Widget>[
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                model.clearFavorites();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
