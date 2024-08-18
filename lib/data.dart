
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class data extends StatelessWidget {
  const data({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 700,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context , index)
                  {
                    return Card(
                      color: Colors.indigo[100],
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My name"),
                            Icon(Icons.phone)
                          ],
                        ) ,
                      ),
                    );
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
