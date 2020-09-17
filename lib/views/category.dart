import 'package:enewspaper/helper/NewsForCategorie.dart';
import 'package:enewspaper/helper/news.dart';
import 'package:enewspaper/model/article.dart';
import 'package:enewspaper/mywidget/BlogTile.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
final String category;

  const CategoryView({Key key, this.category}) : super(key: key);
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  bool _loading=true;
  List<Article> articals =List();


   getArtical() async{
    NewsForCategorie newsForCategorie=new NewsForCategorie();
    print("<<  "+widget.category+" >>");
    await newsForCategorie.getNewsForCategory(widget.category);
    articals=newsForCategorie.news;
    setState(() {

    });
  }



@override
  void initState() {
    getArtical();
    super.initState();
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
      body:
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: articals.length,
              itemBuilder: (context, index) {
                return BlogTile(
                  imgurl: articals[index].urlToImage,
                  title: articals[index].title,
                  description: articals[index].description,
                  blogurl: articals[index].articleUrl,
                );
              }

      ),
        ),


    );
  }
}
