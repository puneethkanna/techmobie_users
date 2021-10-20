import 'package:flutter/material.dart';
import '../packages/md2_tab_indicator.dart';
import '../carousel/carousel.dart';
import '../pages/allScreen/all_content.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({
    Key? key,
  }) : super(key: key);
  bool carouselIsVisible = true;
  Text tabBarAllText() {
    setState() {
      carouselIsVisible = true;
    }

    print("IN ALL");
    return const Text(
      "All",
      textAlign: TextAlign.center,
      //style: TechMobieColors.lightTextStyle,
    );
  }

  Text tabBarShortPostText() {
    setState() {
      carouselIsVisible = false;
      print(carouselIsVisible);
    }

    print("IN SHORT ");
    return const Text(
      "Short Posts",
      textAlign: TextAlign.center,
    );
  }

  Text tabBarArticlesText() {
    setState() {
      carouselIsVisible = false;
    }

    print("IN ARTICLES");
    return const Text(
      "Articles",
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return /*RefreshIndicator(
      child: */
        NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: 220.0,
            stretch: true,
            //collapsedHeight: 1,
            flexibleSpace: FlexibleSpaceBar(
              background: Carousel(),
              stretchModes: const [StretchMode.zoomBackground],
            ),
          ),
        ];
      },
      body: Column(children: <Widget>[
        SizedBox(
          height: 50,
          child: AppBar(
            //backgroundColor: Colors.black87,
            toolbarTextStyle: const TextStyle(color: Color(0xFFE3FFFA)),
            bottom: TabBar(
              labelColor: const Color(0xFFE3FFFA),
              indicator: const MD2Indicator(
                  indicatorHeight: 3,
                  indicatorColor: Color(0xFFE3FFFA),
                  indicatorSize: MD2IndicatorSize
                      .techMobieStyle //3 different modes tiny-normal-full-techMobieStyle
                  ),
              //indicatorWeight: 3.5,
              //indicatorColor: Color(0xFFBE3FFFA),
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Tab(
                  child: tabBarAllText(),
                ),
                Tab(child: tabBarShortPostText()),
                Tab(child: tabBarArticlesText()),
              ],
            ),
          ),
        ),
        Expanded(
            child: TabBarView(children: [
          const AllContent(),

          // second tab bar viiew widget
          Container(
            color: Colors.pink,
            child: const Center(
              child: Text(
                'Car',
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                'BUSSS',
              ),
            ),
          ),
        ]))
      ]),
    );
    /*onRefresh: () async {
        Future.value(true);
      },
    );*/
  }
}
