import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AllTabImages extends StatelessWidget {
  int index;
  List allList;
  AllTabImages({
    Key? key,
    required this.index,
    required this.allList,
  }) : super(key: key);

  getImage() {
    //var allList = get_content.getAllContent();
    try {
      return (CachedNetworkImage(
        imageUrl: allList[index]["imageUrl"],
        cacheKey: allList[index]["imageUrl"],
        //placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) {
          return Image.network(
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          );
        },
        width: 200,
        height: 100,
        fit: BoxFit.cover,
      ));
    } catch (e) {
      //print(e.toString());
      return (Image.network(
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        width: 200,
        height: 100,
        fit: BoxFit.cover,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: getImage(),
    );
  }
}
