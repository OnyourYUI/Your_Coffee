import 'package:flutter/material.dart';
import 'package:your_coffee/pages/IcedCoffee_page.dart';
import 'package:your_coffee/pages/coffeeBean_page.dart';
import 'package:your_coffee/pages/coffeeFreppe_page.dart';
import 'package:your_coffee/pages/hotCoffee_page.dart';
import 'package:your_coffee/pages/login_page.dart';
import 'package:your_coffee/pages/profile_page.dart';

class categoriesPage extends StatefulWidget {
  const categoriesPage({Key? key}) : super(key: key);
  static const routeName = '/category';
  @override
  _categoriesPageState createState() => _categoriesPageState();
}

class _categoriesPageState extends State<categoriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, loginPage.routeName);
            },
          ),
          title: Text('Pickup',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle,
                  size: 30, color: Color(0xFF545D68)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, profilePage.routeName);
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 20.0),
          children: <Widget>[
            SizedBox(height: 15.0),
            Text('Categories',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Color(0xFFEF7532),
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: Color(0xFFCDCDCD),
                tabs: [
                  Tab(
                    child: Text('Hot_Coffee',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text('Iced_Coffee',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text('Coffee_Frappe',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text('Coffee_Bean',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  )
                ]),
            Container(
                height: MediaQuery.of(context).size.height -100,
                width: double.infinity,
                child: TabBarView(controller: _tabController, children: [
                  hotCoffeePage(),
                  icedCoffeePage(),
                  coffeeFreppePage(),
                  coffeeBeanPage(),
                ]))
          ],
        ));
  }
}
