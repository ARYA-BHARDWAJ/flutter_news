import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';

AppBar myAppBar(String title) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          " News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class BlogTile extends StatelessWidget {
  final String imageURL, title, desc, url;
  BlogTile(
      {@required this.imageURL,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: myBoxDecoration(),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageURL)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
        border: Border.all(width: 3.0, color: Colors.black12),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0) //                 <--- border radius here
            ));
  }
}
