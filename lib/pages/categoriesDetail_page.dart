
import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categoriesItem_page.dart';
import 'package:your_coffee/pages/categories_page.dart';

class categoriesDetailPage extends StatefulWidget {
  const categoriesDetailPage({Key? key}) : super(key: key);
  static const routeName = '/detail';
  @override
  _categoriesDetailPageState createState() => _categoriesDetailPageState();
}

class _categoriesDetailPageState extends State<categoriesDetailPage> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as categoriesItem ;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.name, style: TextStyle(fontFamily: 'Varela',fontSize: 20.0,color: Color(0xFF545D68),),),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, categoriesPage.routeName);
          },
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/${args.image}",
                    height: 200.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Coffee: ${args.name}"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Price: ${args.price} Baht"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Detail: ${args.detail}'),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add to cart'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(
                      0xFFEF7532)),
                ),
                onPressed: () {
                  _showMaterialDialog("Finished", "You have already selected.");
                },
              ),


            ],
          ),
        ),
      ),
    );
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.pushReplacementNamed(context, categoriesPage.routeName);
                //Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}