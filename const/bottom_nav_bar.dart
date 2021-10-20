import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import 'new_tab_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  //int selectedIndex = 0;
  bool carouselIsVisible = true;
  tabBarAllText() {
    setState() {
      carouselIsVisible = true;
    }

    print("IN ALL");
    return "All";
    return Text(
      "All",
      textAlign: TextAlign.center,
      //style: TechMobieColors.lightTextStyle,
    );
  }

  tabBarShortPostText() {
    setState() {
      carouselIsVisible = false;
      print(carouselIsVisible);
    }

    print("IN SHORT ");
    return "Short Post";
    return Text(
      "Short Posts",
      textAlign: TextAlign.center,
    );
  }

  tabBarArticlesText() {
    setState() {
      carouselIsVisible = false;
    }

    print("IN ARTICLES");
    return "Articles";
    return Text(
      "Articles",
      textAlign: TextAlign.center,
    );
  }

  void onItemTapped(int index) {
    setState(() {
      MyHomePageState().selectedIndex = index;
    });
    //notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //type: BottomNavigationBarType.fixed,
      iconSize: 0,
      //elevation: 100,
      //selectedIconTheme: IconThemeData(color: Colors.black),
      //selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
      //unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white70,
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16.5,
      ),
      backgroundColor: Colors.black,
      currentIndex: MyHomePageState().selectedIndex, //New
      onTap: onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Text(""), //Icon(Icons.call, semanticLabel: "Test"),
          label: tabBarAllText(),
        ),
        BottomNavigationBarItem(
          icon: Text(""),
          label: tabBarShortPostText(),
        ),
        BottomNavigationBarItem(
          icon: Text(""),
          label: tabBarArticlesText(),
        ),
      ],
    );
  }
}
