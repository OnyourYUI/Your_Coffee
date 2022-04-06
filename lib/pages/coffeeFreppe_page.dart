import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categoriesItem_page.dart';
import 'package:your_coffee/pages/categoriesDetail_page.dart';
class coffeeFreppePage extends StatefulWidget{
  const coffeeFreppePage({Key? key}) : super(key: key);
  _coffeeFreppePageState createState() => _coffeeFreppePageState();
}
class _coffeeFreppePageState extends State<coffeeFreppePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFCFAF8),
        body: ListView(
            children: <Widget>[
              SizedBox(height: 15.0),
              Container(
                  padding: EdgeInsets.only(right: 15.0),
                  width: MediaQuery
                      .of(context).size.width - 50.0,
                  height: MediaQuery.of(context).size.height - 50.0,
                  child: GridView.count(
                      crossAxisCount: 5,
                      primary: false,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        _buildCard('assets/images/cappuccino Frappe wep.jpg', false, true, context,categoriesItem(
                            id: 1,
                            name: 'Cappuccino',
                            price: 65,
                            image: 'cappuccino Frappe wep.jpg',
                            detail: "อากาศร้อน ต้อง Cappuccino Frappe สักแก้วแล้วค่ะ"),),
                        _buildCard('assets/images/Espresso freppe.jpg', false, false, context, categoriesItem(
                            id: 2,
                            name: "Espresso",
                            price: 65,
                            image: "Espresso freppe.jpg",
                            detail: "ตื่นตลอดทั้งวันแน่นอนค่ะ ดื่มตอนท้องไม่ว่างนะคะ"),),
                        _buildCard('assets/images/Latte shake pinterest.jpg', false, false, context, categoriesItem(
                            id: 3,
                            name: "Latte",
                            price: 60,
                            image: "Latte shake pinterest.jpg",
                            detail: "พบกับความหอมนม ละมุนนุ่ม ต้องแก้วนี้ค่ะ"),),
                        _buildCard('assets/images/Macchito freppe.jpg', false, true, context, categoriesItem(
                            id: 4,
                            name: "Macchito",
                            price: 60,
                            image: "Macchito freppe.jpg",
                            detail: "ลองสักครั้งจะต้องติดใจ 👍"),),
                        _buildCard('assets/images/Mocca shake pinterest.jpg', false, true, context,categoriesItem(
                            id: 5,
                            name: "Mocca",
                            price: 60,
                            image: "Mocca shake pinterest.jpg",
                            detail: "อร่อยแน่นอนค่ะ รับประกัน 😆"),),
                      ]
                  )
              ),
              SizedBox(height: 15.0)
            ]
        )
    );
  }
  Widget _buildCard(
       String imgPath, bool added, bool isFavorite, context,categoriesItem item) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                categoriesDetailPage.routeName,
                arguments: item,
              );
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                                : Icon(Icons.favorite_border,
                                color: Color(0xFFEF7532))
                          ])),
                  Hero(
                    tag: imgPath,
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(item.name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 17.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 2.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 17.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 15.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))
                ]))));
  }
}