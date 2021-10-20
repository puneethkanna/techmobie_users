import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../server/get_content.dart' as get_server;
import '../home.dart';
import '../get_image.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

final storage = new FlutterSecureStorage();

class _ArticleListState extends State<ArticleList>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    getAllContent();
  }

  getAndSetId(index) async {
    id = allList1[index]["_id"].toString();
    var temp = id.split('"');
    id = temp[1];
    await storage.write(key: "objectId", value: id);
    return true;
  }

  title(index) {
    try {
      return Flexible(
        child: Text(
          allList1[index]["title"],
          style: const TextStyle(
            color: Color(0xFFE3FFFA),
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } catch (e) {
      return Flexible(
        child: Text(
          allList1[index]["description"],
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      );
    }
  }

  subtitle(index) {
    try {
      return Flexible(
        child: Text(
          allList1[index]["shortDescription"],
          style: const TextStyle(
            color: Colors.white70,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } catch (e) {
      return const Text("");
    }
  }

  var id = "";
  late List allList1 = [];
  late int allCount;
  Future<List> getAllContent() async {
    var allList = await get_server.getArticles();
    allCount = allList.length;
    //setState(() {
    allList1 = allList;
    //});
    return allList;
  }

  Future<void> getAllContentTest() async {
    var allListt = await get_server.getArticles();
    setState(() {
      allCount = allListt.length;
      allList1 = allListt;
    });
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            backgroundColor: Colors.grey.shade900,
            color: Colors.white70,
            //triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: FutureBuilder<List>(
              future: getAllContent(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    Expanded(
                      child: ListView.separated(
                        controller: MyHomePageState().listScrollController,
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        itemCount: allCount,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 0);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 95,
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              //elevation: 100.0,
                              shadowColor: Colors.grey.shade900,
                              //color: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 95,
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: AllTabImages(
                                      index: index,
                                      allList: allList1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              title(index),
                                            ]),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            subtitle(index),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        //physics: const AlwaysScrollableScrollPhysics(),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
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
            ),
            onRefresh: () {
              return getAllContentTest();
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
