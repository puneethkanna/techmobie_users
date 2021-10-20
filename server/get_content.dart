//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mongo_dart/mongo_dart.dart';
//import 'package:intl/intl.dart';

const db = "";

getAllContent() async {
  //var username = await getUsername();
  final db = await Db.create(
      'mongodb+srv://pannu:pannu123nekuenduku@news.dqrln.mongodb.net/myFirstDatabase?retryWrites=true&w=majority');
  await db.open();
  final coll = await db.collection('news');
  final val = await coll
      .find(where
          .sortBy('date', descending: true)
          .sortBy('time', descending: true))
      .toList();
  //print("//printing ALL list");
  //print("$val");
  return val;
}

getShortPosts() async {
  //var username = await getUsername();
  final db = await Db.create(
      'mongodb+srv://pannu:pannu123nekuenduku@news.dqrln.mongodb.net/myFirstDatabase?retryWrites=true&w=majority');
  await db.open();
  final coll = await db.collection('news');
  final val = await coll
      .find(where
          .eq("type", "short_post")
          .sortBy('date', descending: true)
          .sortBy('time', descending: true))
      .toList();
  //print("//printing ShortPosts list");
  //print("$val");
  return val;
}

getArticles() async {
  //var username = await getUsername();
  final db = await Db.create(
      'mongodb+srv://pannu:pannu123nekuenduku@news.dqrln.mongodb.net/myFirstDatabase?retryWrites=true&w=majority');
  await db.open();
  final coll = await db.collection('news');
  final val = await coll
      .find(where
          .eq("type", "article")
          .sortBy('date', descending: true)
          .sortBy('time', descending: true))
      .toList();
  //print("//printing Articles list");
  //print("$val");
  return val;
}

getCarousel() async {
  //var username = await getUsername();
  final db = await Db.create(
      'mongodb+srv://pannu:pannu123nekuenduku@news.dqrln.mongodb.net/myFirstDatabase?retryWrites=true&w=majority');
  await db.open();
  final coll = await db.collection('news');
  final val = await coll
      .find(where
          .eq("type", "article")
          .sortBy('date', descending: true)
          .sortBy('time', descending: true))
      .toList();
  //print("//printing ShortPosts list");
  //print("$val");
  return val;
}
