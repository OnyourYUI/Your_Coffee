import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categoriesDetail_page.dart';
import 'package:your_coffee/pages/categoriesItem_page.dart';


class coffeeBeanPage extends StatefulWidget {
  const coffeeBeanPage({Key? key}) : super(key: key);
  _coffeeBeanPageState createState() => _coffeeBeanPageState();
}

class _coffeeBeanPageState extends State<coffeeBeanPage> {


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
                  _buildCard('assets/images/Arabica beans.jpg',
                      false, true, context, categoriesItem(
                        id: 1,
                        name: 'Arabica',
                        price: 200,
                        image: 'Arabica beans.jpg',
                        detail: "หอมกลิ่นช็อกโกแลตและดอกไม้ รสนุ่นละมุน คาเฟอีนต่ำ 😊"),),
                  _buildCard('assets/images/Robusta beans.jpg',
                      false, true, context,categoriesItem(
                        id: 2,
                        name: "Robusta",
                        price: 180,
                        image: "Robusta beans.jpg",
                        detail: "กลิ่นไม่หอมมาก บอดี้เข้ม ขมฝาด คาเฟออีนสูง 😮"),),
                  _buildCard('assets/images/Excelsa wep.jpg', false,
                      false, context ,categoriesItem(
                      id: 3,
                      name: "Excelsa",
                      price: 100,
                      image: "Excelsa wep.jpg",
                      detail: "รสชาติคล้าย Robusta แต่เมล็ดแก่จะรสคล้าย Arabica"),),
                  _buildCard('assets/images/Liberica wep.jpg',
                      false, false, context, categoriesItem(
                        id: 4,
                        name: "Liberica",
                        price: 100,
                        image: "Liberica wep.jpg",
                        detail: "รสเปรี้ยวอมหวานของผลเบอร์รี นิยมไปเบลนด์กับพันธุ์อื่น เพื่อเพิ่มเอกลักษณ์"),),
                  _buildCard('assets/images/doi chang wep.jpg',
                      false, false, context,categoriesItem(
                        id: 5,
                        name: "Doi Chang",
                        price: 200,
                        image: "doi chang wep.jpg",
                        detail: "ยี่ห้อที่เราไว้ใจ เพราะชนะการประกวดอันดับ 1 ของประเทศไทยในปี 2019 ค่ะ ♥️"),),
                ],
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String imgPath, bool added, bool isFavorite, context,categoriesItem item) {
    int index = 0;

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
