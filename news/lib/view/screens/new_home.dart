import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/logic/cubit/news_cubit.dart';
import 'package:news/view/screens/search_screen.dart';
import 'package:news/view/widget/widget_navigator.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit newsCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(newsCubit.titleAPPBar[newsCubit.currentIndex]),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {
                navigateTo(context,SearchScreen() );
              }, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeMode();
                  },
                  icon: const Icon(Icons.brightness_4_sharp)),
            ],
          ),
          body: newsCubit.screens[newsCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              newsCubit.changeIndex(index);
            },
            currentIndex: newsCubit.currentIndex,
            backgroundColor: Colors.grey.shade200,
            items: newsCubit.bottomItem,
          ),
        );
      },
    );
  }
}
