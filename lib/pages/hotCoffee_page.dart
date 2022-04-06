import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categoriesItem_page.dart';
import 'package:your_coffee/pages/categoriesDetail_page.dart';

class hotCoffeePage extends StatefulWidget {
  const hotCoffeePage({Key? key}) : super(key: key);
  _hotCoffeePageState createState() => _hotCoffeePageState();
}

class _hotCoffeePageState extends State<hotCoffeePage> {
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
                    'assets/images/Americano hot wep.jpg',
                    false,
                    true,
                    context,
                    categoriesItem(
                        id: 1,
                        name: 'Americano',
                        price: 60,
                        image: 'Americano hot wep.jpg',
                        detail: 'สายชอบเข้มๆรับรองถูกใจแน่นอน ส่วนผสม คือ Espresso กับน้ำเปล่า'),
                  ),
                  _buildCard(
                    'assets/images/cappuccino hot wep.jpg',
                    false,
                    false,
                    context,
                    categoriesItem(
                        id: 2,
                        name: 'Cappuccino',
                        price: 50,
                        image: 'cappuccino hot wep.jpg',
                        detail: 'เหมาะสำหรับคนที่พึ่งเริ่มดื่มกาแฟ ส่วนผสมหลัก คือ Espresso และฟองนม'),
                  ),
                  _buildCard(
                    'assets/images/Doppio hot wep.jpg',
                    false,
                    false,
                    context,
                    categoriesItem(
                        id: 3,
                        name: 'Doppio',
                        price: 65,
                        image: 'Doppio hot wep.jpg',
                        detail: 'สายฮาร์ดคอร์อาจจะเคยได้ยินกันบ่อยๆ กับคำว่า Espresso double shot'),
                  ),
                  _buildCard(
                    'assets/images/Espresso hot wep.jpg',
                    false,
                    true,
                    context,
                    categoriesItem(
                        id: 4,
                        name: 'Espresso',
                        price: 50,
                        image: 'Espresso hot wep.jpg',
                        detail: 'Espresso มาจากภาษาอิตาลี แปลว่า เร่งด่วน ส่วนผสม Espresso ปริมาณ 1-2 ออนซ์'),
                  ),
                  _buildCard(
                    'assets/images/FlatWhite hot wep.jpg',
                    false,
                    false,
                    context,
                    categoriesItem(
                        id: 5,
                        name: 'Flat White',
                        price: 40,
                        image: 'FlatWhite hot wep.jpg',
                        detail: 'ส่วนผสมระหว่างกาแฟกับนมสดในปริมาณที่มาก ทำให้น่าทานไม่ขม'),
                  ),
                  _buildCard(
                    'assets/images/Latte hot wep.jpg',
                    false,
                    false,
                    context,
                    categoriesItem(
                        id: 6,
                        name: 'Latte',
                        price: 40,
                        image: 'Latte hot wep.jpg',
                        detail: 'หากใครที่ชอบความหวานมันนุ่มละมุนของฟองนม กาแฟลาเต้นับเป็นตัวเลือกที่ดี ลาเต้ ภาษาอิตาลีแปลว่า นม'),
                  ),
                  _buildCard(
                    'assets/images/Mocca hot wep.jpg',
                    false,
                    true,
                    context,
                    categoriesItem(
                        id: 7,
                        name: 'Mocca',
                        price: 55,
                        image: 'Mocca hot wep.jpg',
                        detail: 'มอคค่า คือกาแฟสายพันธุ์อาราบิก้าแท้ที่มีกลิ่นคล้ายโกโก้ ความพิเศษคือ สี กลิ่น และรสชาติของเมล็ดกาแฟ'),
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
