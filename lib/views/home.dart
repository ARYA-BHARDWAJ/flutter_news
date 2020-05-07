import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/helper/widgets.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
      appBar: myAppBar("Top"),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                children: <Widget>[
                  Container(
                      // categories
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageURL: categories[index].imageURL,
                              categoryName: categories[index].categoryName,
                            );
                          })),
                  // // blogs
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

class CategoryTile extends StatelessWidget {
  final String imageURL, categoryName;
  CategoryTile({this.imageURL, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryNews(category: categoryName)));
        },
        child: Container(
          margin: EdgeInsets.only(right: 16),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                      imageUrl: imageURL,
                      width: 120,
                      height: 60,
                      fit: BoxFit.cover)),
              Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26,
                  ),
                  child: Text(categoryName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)))
            ],
          ),
        ));
  }
}
