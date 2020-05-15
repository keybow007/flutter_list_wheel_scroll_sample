import 'package:flutter/material.dart';

const icons = [
  Icons.add,
  Icons.brightness_1,
  Icons.close,
  Icons.description,
  Icons.extension,
  Icons.face
];

const colors = [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.yellowAccent,
  Colors.greenAccent,
  Colors.white,
  Colors.blueGrey
];

class ItemContent {
  final IconData icon;
  final Color color;
  final String title;

  const ItemContent({this.icon, this.color, this.title});
}

const itemContents = [
  ItemContent(
    icon: Icons.add,
    color: Colors.blueAccent,
    title: "add",
  ),
  ItemContent(
    icon: Icons.brightness_1,
    color: Colors.redAccent,
    title: "brightness",
  ),
  ItemContent(
    icon: Icons.close,
    color: Colors.yellowAccent,
    title: "close",
  ),
  ItemContent(
    icon: Icons.description,
    color: Colors.greenAccent,
    title: "description",
  ),
  ItemContent(
    icon: Icons.extension,
    color: Colors.black54,
    title: "extension",
  ),
  ItemContent(
    icon: Icons.face,
    color: Colors.blueGrey,
    title: "face",
  ),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _slideValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("ListWheelScrollViewSample"),
//        centerTitle: true,
//      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: ListWheelScrollView(
                  children: _listItems,
                  itemExtent: 80.0,
                  //必須（Itemの縦幅）
                  diameterRatio: 3.0,
                  //Wheelの直径（大きいほど緩やかに）
                  squeeze: 0.8,
                  //絞り（間隔的なもの）
                  offAxisFraction: _slideValue,
                ),
              ),
              Expanded(
                flex: 1,
                child: Slider(
                  value: _slideValue,
                  min: -1.0,
                  max: 1.0,
                  onChanged: (value) {
                    setState(() {
                      _slideValue = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final _listItems = List<Widget>.generate(
    icons.length,
    //CardにするとなぜかワークしないのでContainerに
    (int index) => Container(
      color: itemContents[index].color,
      //color: colors[index],
      child: Center(
        child: ListTile(
          leading: Icon(itemContents[index].icon),
          title: Text(itemContents[index].title),
          //leading: Icon(icons[index]),
          //title: Text("Icons"),
        ),
      ),
    ),
  );

//  final _listItems = [
//    ListTile(
//      leading: Icon(Icons.add),
//      title: Text("add"),
//    ),
//    ListTile(
//      leading: Icon(Icons.brightness_1),
//      title: Text("brightness"),
//    ),
//    ListTile(
//      leading: Icon(Icons.close),
//      title: Text("close"),
//    ),
//    ListTile(
//      leading: Icon(Icons.description),
//      title: Text("description"),
//    ),
//    ListTile(
//      leading: Icon(Icons.add),
//      title: Text("add"),
//    ),
//    ListTile(
//      leading: Icon(Icons.extension),
//      title: Text("extension"),
//    ),
//    ListTile(
//      leading: Icon(Icons.face),
//      title: Text("face"),
//    ),
//  ];

}
