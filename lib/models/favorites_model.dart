import 'package:scoped_model/scoped_model.dart';

// Maintains the state of the application
class FavoritesModel extends Model {
  // Stores the list of favorites in a private variable
  List<String> _favorites = [];

  // Get the list of favorites method
  List<String> get favorites => _favorites;

  // Add or remove items from the favorites list
  void toggleFavorite(String item) {
    // Check if item is in the list
    if (_favorites.contains(item)) {
      _favorites.remove(item);
    } else {
      _favorites.add(item);
    }

    // Signal widgets to rebuild
    notifyListeners();
  }

  void clearFavorites() {
    //Clear the list of favorites
    _favorites = [];

    // Signal widgets to rebuild
    notifyListeners();
  }
}
