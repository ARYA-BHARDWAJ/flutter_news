import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/helper/widgets.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(widget.category),
      body: _loading
          ? Center()
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageURL: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                            url: articles[index].url,
                          );
                        }),
                  )
                ],
              )),
            ),
    );
  }
}
