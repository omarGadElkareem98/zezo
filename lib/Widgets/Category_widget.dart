
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  class CategoryItem extends StatelessWidget {

    final String ImageUrl;
    final String text;
    const CategoryItem({Key? key, required this.ImageUrl, required this.text}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Card(

        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            width: 70,


            child: Column(
              children: [
                Image.network(ImageUrl, width: 80, height: 60, fit: BoxFit.cover,),
                SizedBox(height: 15,),

                Text(text , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      );
    }
  }