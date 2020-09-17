import 'package:enewspaper/views/category.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String imgurl, categoryname;

  const CategoryTile({Key key, this.imgurl, this.categoryname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>CategoryView(category:categoryname)));
      },
      child: Container(
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imgurl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Center(
                child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.black26),
              child: Center(
                child: Text(
                  categoryname,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
