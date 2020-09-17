import 'package:cached_network_image/cached_network_image.dart';
import 'package:enewspaper/views/artical.dart';
import 'package:enewspaper/views/category.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imgurl, title, description, blogurl;

  const BlogTile(
      {Key key, this.imgurl, this.title, this.description, this.blogurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ArticalViews(articalUrl: blogurl,)));
      },
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: imgurl,
                      fit: BoxFit.fill,
                    )),
                Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      color: Colors.black26,
                      height: 60,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(description),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
