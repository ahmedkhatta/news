import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'article_item_widget.dart';
import 'my_divider.dart';

class ArticleBuilder extends StatelessWidget {
  const ArticleBuilder({Key? key, required this.list, this.isSearch})
      : super(key: key);
  final List list;
  final bool? isSearch;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: list.isNotEmpty,
        builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ArticleItemWidget(
                article: list[index],
              );
            },
            separatorBuilder: (context, index) => const MyDivider(),
            itemCount: list.length),
        fallback: (context) {
          if (isSearch == false) {
            return Container();
          } else {
            const Center(child: CircularProgressIndicator());
          }
          return Container();
        });
  }
}
