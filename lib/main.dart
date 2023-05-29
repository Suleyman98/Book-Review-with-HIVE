import 'package:flutter/material.dart';
import 'package:hive_test/providers/book_provider.dart';
import 'package:hive_test/screens/book_overview/book_overview_screen.dart';
import 'package:hive_test/screens/deleted_items/deleted_items_screen.dart';
import 'package:hive_test/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('books');
  await Hive.openBox('deleted');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool iconBool = false;
IconData iconLight = Icons.wb_sunny;
IconData iconDark = Icons.nights_stay;
ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
    primaryIconTheme: IconThemeData(color: Colors.teal),
    highlightColor: Colors.black,
    dividerColor: Colors.black);

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(buttonColor: Colors.red),
    primaryIconTheme: IconThemeData(color: Colors.amber),
    highlightColor: Colors.teal,
    dividerColor: Colors.white);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    void changeBool() {
      iconBool = !iconBool;
      setState(() {});
    }

    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: iconBool ? darkTheme : lightTheme,
        home: const SplashScreen(),
        routes: {
          '/home': (context) => ProductOverviewScreen(
                changeBool: changeBool,
                iconDark: iconDark,
                iconLight: iconLight,
              ),
          '/deleted': (context) => const DeleteItems(),
        },
      ),
    );
  }
}
