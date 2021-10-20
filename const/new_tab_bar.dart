import 'package:flutter/material.dart';
import 'package:techmobie/pages/allScreen/all_content.dart';
import 'package:techmobie/pages/home.dart';
import '../const/bottom_nav_bar.dart';

class NewCustomTabBar extends StatefulWidget {
  int selected;
  NewCustomTabBar({Key? key, required this.selected}) : super(key: key);
  @override
  NewCustomTabBarState createState() => NewCustomTabBarState();
}

const List<Widget> pages = <Widget>[
  AllContent(),
  Icon(
    Icons.camera,
    size: 150,
  ),
  Icon(
    Icons.chat,
    size: 150,
  ),
];

class NewCustomTabBarState extends State<NewCustomTabBar> with ChangeNotifier {
//int updatedNumber = Provider.of<_NewCustomTabBarState>(context, listen: true).myNumber;

//NewCustomTabBar v = NewCustomTabBar(selected: selected)
  @override
  Widget build(BuildContext context) {
    return pages.elementAt(MyHomePageState().selectedIndex);
  }
}
/*class NewCustomTabBar extends StatelessWidget {
  int selected;
  ValueNotifier<int> selected1 = ValueNotifier(0);
  NewCustomTabBar({Key? key, required this.selected}) : super(key: key);
  List<Widget> pages = <Widget>[
    AllContent(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];
  /*@override
  void init(){
    onChanged(){

    }
  }*/
  @override
  void initState() {
    ValueNotifier selected1 = ValueNotifier(selected);
    print("IN INIT...");
  }

  //ValueNotifier<int> _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      builder: (BuildContext context, int value, Widget? child) {
        // This builder will only get called when the _counter
        // is updated.
        return pages.elementAt(value);
      },
      valueListenable: selected1,
    );
  }
}
*/