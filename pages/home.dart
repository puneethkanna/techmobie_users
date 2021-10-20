import 'package:flutter/material.dart';
import 'package:techmobie/navigation_bar/custom_animated_bottom_bar.dart';
import '../const/tab_bar_build.dart';
import '../server/get_content.dart' as get_server;
import '../const/bottom_nav_bar.dart';
import '../const/new_tab_bar.dart';
import 'allScreen/all_content.dart';
import 'articlesSreen/article_list.dart';
import 'shortPostScreen/short_post.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  final PageController homePageController = PageController(
    initialPage: 0,
  );
  final ScrollController listScrollController = ScrollController();
  var scroll = 0;
  @override
  bool get wantKeepAlive => true;
  var id = "";
  late List allList1 = [];
  late List carouselList1 = [];
  late int allCount;
  int selectedIndex = 0;

  Future<List> getWholeContent() async {
    var allList = await get_server.getAllContent();
    allCount = allList.length;
    allList1 = allList;
    //var carouselList = await get_server.getCarousel();
    return allList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    homePageController.jumpTo(selectedIndex.toDouble());
    //notifyListeners();
  }

  List<Widget> pages = <Widget>[
    AllContent(),
    const Icon(
      Icons.camera,
      size: 150,
      color: Colors.white,
    ),
    const Icon(
      Icons.chat,
      size: 150,
      color: Colors.white,
    ),
  ];
  void bottomTapped(int index) {
    if (selectedIndex == index) {
      setState(() {
        selectedIndex = 0;
        scroll += 1;
        ValueNotifier(scroll);
        listScrollController.animateTo(
            listScrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn);
      });
      homePageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      setState(() {
        selectedIndex = index;
        homePageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      });
    }
  }

  final _inactiveColor = const Color(0xFFE3FFFA);
  final _activeColor = const Color(0xFFE3FFFA);
  AppBar appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar: SizedBox(
        height: 55,
        child: BottomNavigationBar(
          //type: BottomNavigationBarType.fixed,
          iconSize: 0,
          selectedIconTheme: IconThemeData(size: 0),
          //selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
          unselectedIconTheme: IconThemeData(size: 0),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white70,
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.5,
            backgroundColor: Colors.green,
          ),
          backgroundColor: Colors.black,
          currentIndex: selectedIndex,
          onTap: bottomTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Text(""), //Icon(Icons.call, semanticLabel: "Test"),
              label: "All",
            ),
            BottomNavigationBarItem(
              icon: Text(""),
              label: "Short  Posts",
            ),
            BottomNavigationBarItem(
              icon: Text(""),
              label: "Articles",
            ),
          ],
        ),
      ),
      //const BottomNavBar(),
      /*BottomAppBar(
          color: Colors.black87,
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),*/*/
      appBar: AppBar(
        //backgroundColor: Colors.black87,
        title: const Text(
          'Tech Mobie',
        ),
        centerTitle: true,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
      ),
      bottomNavigationBar: CustomAnimatedBottomBar(
        containerHeight: 58,
        backgroundColor: Colors.black,
        selectedIndex: selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: bottomTapped,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            //icon: Text(""),
            title: const Text('All'),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            //icon: Text(""),
            title: const Text('Short Posts'),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            //icon: Text(""),
            title: const Text(
              'Articles',
            ),
            activeColor: _activeColor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: homePageController,
        onPageChanged: (pageIndex) {
          setState(() {
            selectedIndex = pageIndex;
          });
          /*pages
            .elementAt(selectedIndex)*/ /*RefreshIndicator(
          child: */
          //CustomTabBar(),
          /*onRefresh: () async {
            Future.value(true);
          },*/
        },
        children: const [
          AllContent(),
          ShortPost(),
          ArticleList(),
        ],
      ),
    );
  }
}
