import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categoriesItem_page.dart';
import 'package:your_coffee/pages/categoriesDetail_page.dart';

class icedCoffeePage extends StatefulWidget {
  const icedCoffeePage({Key? key}) : super(key: key);
  _icedCoffeePageState createState() => _icedCoffeePageState();
}

class _icedCoffeePageState extends State<icedCoffeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 50.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 5,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard(
                    'assets/images/Americano ice wep.jpg',
                    false,
                    true,
                    context,
                    categoriesItem(
                        id: 1,
                        name: 'Americano',
                        price: 65,
                        image: 'Americano ice wep.jpg',
                        detail: 'ถ้าต้องการตื่นเต็มตาต้องจัดสักแก้ว ไม่ใส่น้ำตาลนะคะ'),
                  ),
                  _buildCard(
                    'assets/images/cappuccino ice pinterest.jpg',
                    false,
                    true,
                    context,
                    categoriesItem(
                        id: 2,
                        name: 'Cappuccino',
                        price: 60,
                        image: 'cappuccino ice pinterest.jpg',
                        detail: 'สำหรับสาวๆที่ชอบความละมุนของฟองนมต้องลองแล้วค่ะ'),
                  ),
                  _buildCard(
                    'assets/images/Espresso ice pinterest.jpg',
                    false,
                    true,
                    context,
                    categoriesItem(
                        id: 3,
                        name: 'Espresso',
                        price: 65,
                        image: 'Espresso ice pinterest.jpg',
                        detail: 'สำหรับคนเท่ๆ คูลๆ ต้องเจอกันหน่อยค่ะ'),
                  ),
                  _buildCard(
                    'assets/images/Mocca ice wep.jpg',
                    false,
                    false,
                    context,
                    categoriesItem(
                        id: 4,
                        name: 'Mocca',
                        price: 55,
                        image: 'Mocca ice wep.jpg',
                        detail: 'คนที่ชอบกาแฟกับช็อกโกแลตต้องชอบแน่นอนค่ะ'),
                  ),
                  _buildCard(
                    'assets/images/Latte ice pinterest.jpg',
                    false,
                    false,
                    context,
                    categoriesItem(
                        id: 5,
                        name: 'Latte',
                        price: 55,
                        image: 'Latte ice pinterest.jpg',
                        detail: 'คนที่อยากกินกาแฟแบบไม่ขม หอมนมต้องลองค่ะ'),
                  ),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String imgPath, bool added, bool isFavorite, context,
      categoriesItem item) {
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
