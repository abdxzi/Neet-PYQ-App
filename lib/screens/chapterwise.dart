import 'package:flutter/material.dart';
import 'package:neet_app/components/home_screen_btn.dart';

class buttonData {
  final String text;
  final String iconPath;
  final String route;

  buttonData({required this.text, required this.iconPath, required this.route});
}

class Chapterwise extends StatelessWidget {
  Chapterwise({super.key});

  final List<buttonData> buttonList = [
    buttonData(
      text: "Physics", 
      iconPath: "assets/phy.png", 
      route: "/physics"
    ),
    buttonData(
      text: "Chemistry", 
      iconPath: "assets/chem.png", 
      route: "/chemistry"
    ),
    buttonData(
      text: "Biology", 
      iconPath: "assets/bio.png",
      route: "/biology"
    )
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chapterwise Questions",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: buttonList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: HomeSceenBtn(
                  onPressed: (){
                    Navigator.pushNamed(context, buttonList[index].route);
                  }, 
                  buttonText: buttonList[index].text, 
                  imagePath: buttonList[index].iconPath),
              ),
            ],
          );
        }
        ),
      ),
    );
  }
}