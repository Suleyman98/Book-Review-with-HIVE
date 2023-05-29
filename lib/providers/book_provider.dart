import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/book_model.dart';

class BookProvider with ChangeNotifier {
  List<BookModel> _items = [];
  List<BookModel> _deletedItems = [];
  List<BookModel> searchedBooks = [];
  bool _isFiltering = false;
// -----------------   Global Form Key   ---------------
  final formKey = GlobalKey<FormState>();
  // String? validate(value) {
  //   if (value == null || value == '') {
  //     return 'Please enter values';
  //   } else {
  //     return null;
  //   }
  // }

  // -----------------     Global Form Key       ---------------

  List<String> selectedFilters = [];

  var isFavorite = false;
  final deletedBook = Hive.box('deleted');
  final book = Hive.box('books');
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController img = TextEditingController();
  TextEditingController search = TextEditingController();

  List<BookModel> get favoriteBooks {
    return _items.where((element) => element.isFavorite == true).toList();
  }

  bool get isFiltering {
    return _isFiltering;
  }

  List<BookModel> get items {
    return _items;
  }

  List<BookModel> get boxValues {
    return book.values.map((value) {
      return BookModel.fromJson(json.decode(value));
    }).toList();
  }

  List<BookModel> get usedBooks {
    return isFavorite ? favoriteBooks : items;
  }

  List<BookModel> get deletedItems {
    return _deletedItems;
  }

  void filterItems() {
    if (selectedFilters.isEmpty) {
      refresh();
    } else {
      _items = []; // check this part

      if (selectedFilters.contains('Cheapest')) {
        _items.addAll(boxValues
            .where(
                (element) => element.price! < 11 && !_items.contains(element))
            .toList());
        notifyListeners();
      }
      if (selectedFilters.contains('Most Expensive')) {
        _items.addAll(boxValues
            .where(
                (element) => element.price! > 100 && !_items.contains(element))
            .toList());
        notifyListeners();
      }
      if (selectedFilters.contains('Most Rated')) {
        _items.addAll(boxValues
            .where(
                (element) => element.rating == 5 && !_items.contains(element))
            .toList());
        notifyListeners();
      }
      if (selectedFilters.contains('Less Rated')) {
        _items.addAll(boxValues
            .where(
                (element) => element.rating == 1 && !_items.contains(element))
            .toList());
        notifyListeners();
      }
    }
    searchBook(_items);
  }

  int findIndex(BookModel currentModel) {
    return book.values
        .map((value) {
          return BookModel.fromJson(json.decode(value));
        })
        .toList()
        .indexWhere((element) => element.title == currentModel.title);
  }

  void setFavoriteOrAll(bool isFav) {
    isFavorite = isFav;
    selectedFilters = [];
    search.text = '';
    refresh();
    notifyListeners();
  }

  void setFilterScreen() {
    _isFiltering = !_isFiltering;
    notifyListeners();
  }

  searchBook(List<BookModel> books) {
    searchedBooks = books
        .where((element) => element.title!
            .toLowerCase()
            .startsWith(search.text.toString().toLowerCase()))
        .toList();
    //check this part
    notifyListeners();
  }

  void addNewFilter(String filter) {
    selectedFilters.add(filter);
    notifyListeners();
  }

  void removeFilter(String filter) {
    selectedFilters.remove(filter);
  }

  void addBook() async {
    final data = BookModel(
        description: description.text,
        isFavorite: false,
        rating: 0,
        price: double.parse(price.text),
        imageUrl: img.text,
        title: title.text);
    String jsonA = json.encode(data.toJson());
    await book.add(jsonA);
    refresh();
    searchBook(boxValues);
    filterItems();
  }

  void toggleFavorite(BookModel currentModel) async {
    final currModel = boxValues[findIndex(currentModel)];
    final newModel = BookModel(
      rating: currModel.rating,
      description: currModel.description,
      title: currModel.title,
      imageUrl: currModel.imageUrl,
      price: currModel.price,
      isFavorite: !currModel.isFavorite!,
    );
    String jsonA = json.encode(newModel.toJson());
    await book.putAt(findIndex(currModel), jsonA);
    refresh();
    filterItems();
  }

  void setRating(double val, BookModel currentModel) async {
    final currModel = boxValues[findIndex(currentModel)];
    final newModel = BookModel(
        description: currModel.description,
        title: currModel.title,
        imageUrl: currModel.imageUrl,
        price: currModel.price,
        isFavorite: currModel.isFavorite,
        rating: val);
    String jsonA = json.encode(newModel.toJson());
    await book.putAt(findIndex(currentModel), jsonA);
    refresh();
    searchBook(boxValues);
    filterItems();
  }

  void undeleteBook(int index, BookModel bookUndelete) async {
    String jsonA = json.encode(bookUndelete.toJson());
    await deletedBook.deleteAt(index);
    await book.add(jsonA);
    refresh();
    refreshDeleted();
    searchBook(boxValues);
    filterItems();
  }

  void deletePermanently(BuildContext context) async {
    if (deletedBook.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You already deleted all items!"),
      ));
    } else {
      await deletedBook.clear();
      refreshDeleted();
    }
  }

  void cleanInputs() {
    title.text = '';
    description.text = '';
    price.text = '';
    img.text = '';
    notifyListeners();
  }

  void deleteBook(BookModel currentbook) async {
    BookModel currModel = boxValues[findIndex(currentbook)];
    String jsonA = json.encode(currModel.toJson());
    await deletedBook.add(jsonA);
    await book.deleteAt(findIndex(currentbook));
    refresh();
    refreshDeleted();
    searchBook(boxValues);
    filterItems();
  }

  void editBook(BookModel currentModel) async {
    final currModel = boxValues[findIndex(currentModel)];
    final newModel = BookModel(
        isFavorite: currModel.isFavorite,
        title: title.text,
        description: description.text,
        price: double.parse(price.text),
        imageUrl: img.text);
    String jsonA = json.encode(newModel.toJson());

    await book.putAt(findIndex(currModel), jsonA);
    refresh();
    searchBook(boxValues);
    filterItems();
  }

  void refresh() async {
    _items = book.values.map((value) {
      return BookModel.fromJson(json.decode(value));
    }).toList();
    _items.sort((a, b) {
      return a.title!.toLowerCase().compareTo(b.title!.toLowerCase());
    });
    notifyListeners();
  }

  void refreshDeleted() async {
    final data = deletedBook.values.map((value) {
      return BookModel.fromJson(json.decode(value));
    }).toList();
    _deletedItems = data;
    _deletedItems.sort((a, b) {
      return a.title!.toLowerCase().compareTo(b.title!.toLowerCase());
    });
    notifyListeners();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    img.dispose();
    search.dispose();
    super.dispose();
  }
}
