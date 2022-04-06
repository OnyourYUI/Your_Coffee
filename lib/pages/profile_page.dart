import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categories_page.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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
            Navigator.pushReplacementNamed(context, categoriesPage.routeName);
          },
        ),
        title: Text('Profile',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF575E67))),
      ),
      body: Container(
        color: Color(0xFFF1F1F1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 190.0,
                    height: 190.0,
                    child: Image.asset('assets/images/profile.jpg'),
                  )),
              Text("Onyuorm_ark"),
              Text("Onyourm_ark@gmail.com"),
            ],
          ),
        ),

      ),
    );
  }
}