import 'package:cash_rich/pages/main_page.dart';
import 'package:cash_rich/provider/coin_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CoinSearchProvider()),
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                scaffoldBackgroundColor: Color(0xff353432),
                primaryColor: Color(0xffDAC536),
                appBarTheme: AppBarTheme(
                  backgroundColor: Color(0xff000000),
                )),
            home: const MainPage(),
          );
        });
  }
}
