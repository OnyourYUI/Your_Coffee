import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:your_coffee/pages/categories_page.dart';
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var input = '';
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFCDCDCD),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(90.0),
                              child: Container(
                                width: 190.0,
                                height: 190.0,
                                child: Image.asset('assets/images/Coffe Logo.jpg'),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('YOUR_COFFEE',style: TextStyle(color: Color(
                                0xFF000000),fontSize: 25.0),),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var j = 0; j < input.length; j++)
                            Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Color(0xFFD17E50),
                            ),
                          for (var i = 0; i < 6 - input.length; i++)
                            Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Color(0xFFA0A0A0),
                            ),
                        ],
                      ),
                    ),
                    if (!check) Text("Incorrect Password",style: TextStyle(color: Color(
                        0xFF545D68)),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Container(
                  color: Color(0xFFCDCDCD),

                  child: Column(
                    children: [
                      Text(('')),
                      Column(
                          children: [
                            [1, 2, 3],
                            [4, 5, 6],
                            [7, 8, 9],
                            [-2, 0, -1],
                          ].map((row) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: row.map((item) {
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: LoginButton(
                                    number: item,
                                    onClick: _handleClickButton,
                                  ),
                                );
                              }).toList(),
                            );
                          }).toList()),
                      TextButton(
                        child: Text('Forget Password',style: TextStyle(color:  Color(
                            0xFF545D68)),),
                        onPressed: () {
                          _showMaterialDialog("Password", "020899");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
void _handleClickButton(int num) {
  setState(
        () {
      if (input.length > 0 && num == -1) {
        input = input.substring(0, input.length - 1);
      } else if (num != -1) {
        input = "$input$num";
      }
      if (input == "020899" && input.length == 6) {
        Navigator.pushReplacementNamed(context, categoriesPage.routeName);
      } else if (input != "020899" && input.length == 6) {
        //_showMaterialDialog("ERROR", "Invalid PIN.Please Try again.");
        check = false;
        input = "";
      }
    },
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
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;
  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFCDCDCD),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: number == -2 ? null : () => onClick(number),
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: number == -2
              ? null
              : BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color:  Color(0xFFEF7532)),
          ),
          child: Center(
            child: number >= 0
                ? Text(
              "$number",
              style: TextStyle(fontSize: 25,color: Color(0xFF545D68))
            )
                : (number == -1
                ? Icon(
              Icons.backspace_outlined,
              size: 28.0,
              color: Color(0xFFD17E50),
            )
                : SizedBox.shrink()),
          ),
        ),
      ),
    );
  }
}

