import 'package:enewspaper/helper/data.dart';
import 'package:enewspaper/helper/news.dart';
import 'package:enewspaper/model/article.dart';
import 'package:enewspaper/model/category_model.dart';
import 'package:enewspaper/mywidget/BlogTile.dart';
import 'package:enewspaper/mywidget/CategoryTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = new List();
  List<Article> articals = new List();
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articals = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "e",
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24),
              ),
              Text(
                " Learning",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),
              )
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                   flex: 1,
                    child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              imgurl: categories[index].imageAssetUrl,
                              categoryname: categories[index].categorieName);
                        }),
                  ),
            SizedBox(height: 20,),
            Expanded(
              flex: 9,
              child:  ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                      itemCount: articals.length,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imgurl: articals[index].urlToImage,
                          title: articals[index].title,
                          description: articals[index].description,
                          blogurl: articals[index].articleUrl,
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
