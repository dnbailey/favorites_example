import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_example/models/favorites_model.dart';

// Creates a list screen based on the list passed to it
class ListScreen extends StatelessWidget {
  // Local variables
  final String title;
  final List<String> list;

  // Constructor
  const ListScreen({Key key, @required this.title, @required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      // Give the list access to the model
      body: ScopedModelDescendant<FavoritesModel>(
        builder: (context, child, model) => buildListView(model),
      ),
    );
  }

  // AppBar widget
  AppBar buildAppBar() {
    return AppBar(
      title: Text(title),
    );
  }

  // Build the list
  ListView buildListView(FavoritesModel model) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(list[index]),
          trailing: IconButton(
            onPressed: () => model.toggleFavorite(list[index]),
            icon: buildIcon(model, index),
          ),
        );
      },
    );
  }

  // Switch the favorite icon based on state in favorites list
  Icon buildIcon(FavoritesModel model, int index) {
    return Icon(model.favorites.contains(list[index])
        ? Icons.favorite
        : Icons.favorite_border);
  }
}
