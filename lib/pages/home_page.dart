import 'package:cherry_app/models/news_data.dart';
import 'package:cherry_app/pages/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';

const String appGroupId = 'group.com.cherry.cherry-app';
const String iOSWidgetName = 'CherryWidgets';

void updateHeadline(NewsArticle newHeadline) {
  HomeWidget.saveWidgetData<String>('headline_title', newHeadline.title);
  HomeWidget.saveWidgetData<String>(
      'headline_description', newHeadline.description);
  HomeWidget.updateWidget(
    iOSName: iOSWidgetName,
  );
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    HomeWidget.setAppGroupId(appGroupId);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Top Stories'),
            centerTitle: false,
            titleTextStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        body: ListView.separated(
          separatorBuilder: (context, idx) {
            return const Divider();
          },
          itemCount: getNewsStories().length,
          itemBuilder: (context, idx) {
            final article = getNewsStories()[idx];
            return ListTile(
              key: Key('$idx ${article.hashCode}'),
              title: Text(article.title),
              subtitle: Text(article.description),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<ArticleScreen>(
                    builder: (context) {
                      return ArticleScreen(article: article);
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
