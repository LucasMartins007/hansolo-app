import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hackaton2025/app/presentation/pages/HelpPage.dart';
import 'package:hackaton2025/app/presentation/pages/home/presentation/manager/HomePageManager.dart';
import 'package:hackaton2025/app/presentation/pages/nutrient-options/presentation/pages/NutrientOptionsPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(70, 70),
        child: AppBar(
          backgroundColor: Color.fromARGB(999, 76, 175, 80),
          title: Container(
            padding: EdgeInsets.only(top: 20, left: 5),
            child: Text(
              "Hansolo App",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 27),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          /*decoration: BoxDecoration(color: Colors.black),*/
          child: Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              spacing: 40,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 199, 132, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 1,
                              spreadRadius: 3,
                              blurStyle: BlurStyle.inner,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        width: 275,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.analytics_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Análise de solo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () => HomePageManager()
                          .redirectTo(context, Nutrientoptionspage()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 199, 132, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1,
                                spreadRadius: 3,
                                blurStyle: BlurStyle.inner,
                                offset: Offset(3, 3)),
                          ],
                        ),
                        width: 275,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.format_align_center_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Entrada de Dados",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () async => {
                        HomePageManager().pickFile(),
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(width: 20),
                                    Text("Carregando..."),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        await Future.delayed(
                          Duration(seconds: 3),
                        ),
                        Navigator.of(context).pop(),
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 20),
                                    Text("Dados enviados com sucesso para Análise!!"),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        await Future.delayed(Duration(seconds: 1)),
                        Navigator.of(context).pop(),
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          HomePageManager().redirectTo(context, Helppage()),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(129, 199, 132, 1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 1,
                                spreadRadius: 3,
                                blurStyle: BlurStyle.inner,
                                offset: Offset(3, 3)),
                          ],
                        ),
                        width: 275,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.sos,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Ajuda",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
