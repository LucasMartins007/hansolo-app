import 'package:flutter/material.dart';
import 'package:hackaton2025/app/presentation/pages/analytics/presentation/pages/AnalyticsPage.dart';
import 'package:hackaton2025/app/presentation/pages/nutrient-options/presentation/manager/NutritientOptionsManager.dart';

class Nutrientoptionspage extends StatefulWidget {
  const Nutrientoptionspage({super.key});

  @override
  State<Nutrientoptionspage> createState() => _NutrientoptionspageState();
}

class _NutrientoptionspageState extends State<Nutrientoptionspage> {
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
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => NutritientOptionsManager().redirectTo(
                        context,
                        Analyticspage(nutrient: "M.O",),
                      ),
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
                        width: 175,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.panorama_wide_angle,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Matéria orgânica",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => NutritientOptionsManager().redirectTo(
                        context,
                        Analyticspage(nutrient: "Potássio (K)",),
                      ),
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
                        width: 175,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.stars_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Potássio",
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
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => NutritientOptionsManager().redirectTo(
                        context,
                        Analyticspage(nutrient: "Fósforo (P)",),
                      ),
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
                        width: 175,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.fireplace_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Fósforo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => NutritientOptionsManager().redirectTo(
                        context,
                        Analyticspage(nutrient: "Nitrogenio (N)",),
                      ),
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
                        width: 175,
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Icon(
                                size: 50,
                                Icons.cloud_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Nitrogênio",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
