import 'package:flutter/material.dart';
import 'package:hive_test/providers/book_provider.dart';
import 'package:hive_test/screens/book_overview/book_overview_screen.dart';
import 'package:hive_test/screens/deleted_items/deleted_items_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('books');
  await Hive.openBox('deleted');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const ProductOverviewScreen(),
        routes: {
          '/deleted': (context) => const DeleteItems(),
        },
      ),
    );
  }
}
