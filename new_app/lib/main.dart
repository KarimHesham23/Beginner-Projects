import 'package:flutter/material.dart';
import 'package:new_app_2/models/get_news_model.dart';
import 'package:new_app_2/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetNews(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => const HomeView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
