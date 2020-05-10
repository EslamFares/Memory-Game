import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/data/data.dart';

import 'model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TileModel> gridViewTiles = new List<TileModel>();
  List<TileModel> questionPairs = new List<TileModel>();
  @override
  void initState() {
    super.initState();
    reStart();
    pairs = getPairs();
    pairs.shuffle();
    visiblePairs = pairs;
    selected = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
      });
    });
  }

  void reStart() {
    pairs = getPairs();
    pairs.shuffle();
    gridViewTiles = pairs;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        print("restart");
        questionPairs = getQuestions();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Text(
                  '$point/800',
                  style: TextStyle(fontSize: 40,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Points',
                  style: TextStyle(fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GridView(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 0.0,
                ),
                children: List.generate((visiblePairs.length).toInt(),(index) {
                  return Tile(
                    imageAssetsPath: visiblePairs[index].getImageAssetsPath(),
                    parent: this,
                    tileIndex: index,
                  );
                })),
            SizedBox(
              height: 60,
            ),
            point == 800
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        point = 0;
                        reStart();
                      });
                    },
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber, width: 5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        'Replay',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      )),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        point = 0;
                        reStart();
                      });
                    },
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 5),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        'Restart',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      )),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String imageAssetsPath;
  int tileIndex;
  _HomePageState parent;
  Tile({this.imageAssetsPath, this.parent, this.tileIndex});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          if (selectedImageAssetsPath != '') {
            if (selectedImageAssetsPath ==
                pairs[widget.tileIndex].getImageAssetsPath()) {
              print('correct');
              selected = true;
              Future.delayed(const Duration(milliseconds: 500), () {
                point = point + 100;
                setState(() {});
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetsPath("");
                  pairs[selectedTileIndex].setImageAssetsPath("");
                });
                selectedImageAssetsPath = '';
              });
            } else {
              print('wrong');
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                selected = false;
                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                selectedImageAssetsPath = '';
              });
            }
          } else {
            selectedTileIndex = widget.tileIndex;
            selectedImageAssetsPath =
                pairs[widget.tileIndex].getImageAssetsPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          print('click ok');
        }
      },
      child: Container(
          margin: EdgeInsets.all(5),
          child: pairs[widget.tileIndex].getImageAssetsPath() != ""
              ? Image.asset(pairs[widget.tileIndex].getIsSelected()
                  ? pairs[widget.tileIndex].getImageAssetsPath()
                  : widget.imageAssetsPath)
              : Image.asset('assets/correct.png')),
    );
  }
}
