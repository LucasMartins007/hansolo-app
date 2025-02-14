import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helppage extends StatefulWidget {
  const Helppage({super.key});

  @override
  State<Helppage> createState() => _HelppageState();
}

class _HelppageState extends State<Helppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(70, 70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(999, 76, 175, 80),
          title: GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 5),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(right: 25),
                  ),
                  Text(
                    "Voltar ao Início",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        padding: EdgeInsets.all(15),
        child: Image.asset('images/help.png'),
      ),
    );
  }
}
