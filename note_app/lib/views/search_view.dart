import 'package:flutter/material.dart';

import 'package:note_app/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "search view";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody(),
    );
  }
}
