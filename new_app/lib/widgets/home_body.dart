import 'package:flutter/material.dart';
import 'package:new_app_2/widgets/category_list_view.dart';
import 'package:new_app_2/widgets/news_list_view_builder.dart';

class HomewBody extends StatelessWidget {
  const HomewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: CustomScrollView(
        // physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CategoryListView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          NewsListViewbuilder(),
        ],
      ),
    );
  }
}
