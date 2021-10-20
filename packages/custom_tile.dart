/*import 'package:flutter/material.dart';

class ActivityListTile extends StatelessWidget {
  String? title;
  String? subtitle;
  Widget? trailingImage;
  VoidCallback? onTab;
  Color? color;
  Color? gradient;

  ActivityListTile(
      {Key? key,
      this.title,
      this.color,
      this.gradient,
      this.onTab,
      this.subtitle,
      this.trailingImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: GestureDetector(
        onTap: onTab,
        child: Stack(alignment: Alignment.bottomRight, children: <Widget>[
          Card(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(5.0)),
                      gradient: LinearGradient(
                          colors: [color, gradient],
                          begin: Alignment.topCenter,
                          end: Alignment.topRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(title),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          subtitle,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ))),
          Logo(),
          Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(child: trailingImage))
        ]),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, right: 4.0),
      child: Container(
        child: Image.asset(
          'assets/images/icon.png',
          height: 110,
        ),
      ),
    );
  }
}
*/