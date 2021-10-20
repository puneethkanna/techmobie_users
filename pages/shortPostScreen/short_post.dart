//import 'dart:html';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techmobie/pages/home.dart';
import '../../server/get_content.dart' as get_content;
import 'package:google_fonts/google_fonts.dart';

class ShortPost extends StatefulWidget {
  const ShortPost({Key? key}) : super(key: key);

  @override
  _ShortPostState createState() => _ShortPostState();
}

class _ShortPostState extends State<ShortPost>
    with AutomaticKeepAliveClientMixin {
  final PageController _shortPostController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _scrollController.dispose();
    _shortPostController.dispose();
    super.dispose();
  }

//var id = "";
  var index = 0;
  late List allList1 = [];
  late int allCount;
  Future<List> getShortPosts() async {
    var allList = await get_content.getShortPosts();
    allCount = allList.length;
    //setState(() {
    allList1 = allList;
    //});
    return allList;
  }

  shortPostText(index) {
    return Text(
      allList1[index]["description"],
      style: GoogleFonts.cabin(
        //montserrat, oxygen, cabiun, mulish
        color: Colors.white,
        //leadingDistribution: TextLeadingDistribution.even,
        fontWeight: FontWeight.w600,
        //fontFamily: montserrat,
        //wordSpacing: 0.0,
        fontSize: 17,
      ),
      textAlign: TextAlign.justify,
      softWrap: true,
      //textScaleFactor: 1.2,
    );
  }

  getImage(index) {
    //var allList = get_content.getAllContent();
    try {
      return AspectRatio(
        aspectRatio: 5 / 2,
        child: CachedNetworkImage(
          imageUrl: allList1[index]["imageUrl"],
          cacheKey: allList1[index]["imageUrl"],
          //placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) {
            return Image.network(
              'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
              width: MediaQuery.of(context).size.width,
              //height: ((MediaQuery.of(context).size.height) / 2),
              fit: BoxFit.fitHeight,
            );
          },
          width: MediaQuery.of(context).size.width,
          //height: ((MediaQuery.of(context).size.height) / 100) * 45,
          fit: BoxFit.fitHeight,
        ),
      );
    } catch (e) {
      //print(e.toString());
      return (Image.network(
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        width: MediaQuery.of(context).size.width,
        //height: ((MediaQuery.of(context).size.height) / 100) * 60,
        fit: BoxFit.cover,
      ));
    }
  }

  Future<void> getShortPostContentTest() async {
    var allListt = await get_content.getShortPosts();
    setState(() {
      allCount = allListt.length;
      allList1 = allListt;
    });
    return Future.delayed(const Duration(seconds: 0));
  }

  bool _showBackToTopButton = false;

  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (index != 0) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  // This function is triggered when the user presses the back-to-top button
  _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 3), curve: Curves.linear);
  }

  topUpButton() {
    if (_showBackToTopButton == false) {
      return Visibility(
        visible: false,
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          child: Icon(Icons.arrow_upward),
        ),
      );
    } else {
      return Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          child: Icon(Icons.arrow_upward),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getShortPosts(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Expanded(
              child: RefreshIndicator(
                backgroundColor: Colors.grey.shade900,
                color: Colors.white70,
                child: PageView.builder(
                  clipBehavior: Clip.hardEdge,
                  //dragStartBehavior: DragStartBehavior.start,
                  //allowImplicitScrolling: true,
                  itemCount: allCount,
                  scrollDirection: Axis.vertical,
                  controller: _shortPostController,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          color: Colors.black, //Colors.grey.shade900,
                          //const Color(0xFFD2C2C30), //Colors.grey.shade900,
                          width: MediaQuery.of(context).size.width,
                          height:
                              ((MediaQuery.of(context).size.height) / 100) * 40,
                          //height:
                          // ((MediaQuery.of(context).size.height) / 100) * 60,
                          child: getImage(index),
                        ),
                        /*const Divider(
                          color: Color(0xFFE3FFFA),
                          height: 1,
                          thickness: 1,
                        ),*/
                        Container(
                          color: Colors.grey.shade900, //withOpacity(0.1),
                          height: (MediaQuery.of(context).size.height) - 495,
                          /*MyHomePageState().appBar.preferredSize.height -
                              58,*/
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          //color: Color(0xFFD2C2C30), //Colors.grey.shade900,
                          child: shortPostText(index),
                        ),
                        /*Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            width: double.infinity,
                            child: topUpButton(),
                          ),
                        ),*/
                      ],
                    );
                  },
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                ),
                onRefresh: () {
                  return getShortPostContentTest();
                },
              ),
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SpinKitFadingCube(
              size: 50.0,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? const Color(0xFF021B52)
                        : const Color(0xFFE3FFFA),
                  ),
                );
              },
              duration: const Duration(seconds: 1),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
