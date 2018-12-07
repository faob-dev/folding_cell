#### example/lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

void main() => runApp(MaterialApp(home: SafeArea(child: Scaffold(body: Material(child: FoldingCellSimpleDemo())))));

/// Example 1 folding cell inside [Container]
class FoldingCellSimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      alignment: Alignment.topCenter,
      child: _buildCell(context, 0),
    );
  }
}

/// Example 2 folding cell inside [ListView]
class FoldingCellListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext pcontext) {
    return Container(
      color: Color(0xFF2e282a),
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return _buildCell(pcontext, index);
          }),
    );
  }
}

Widget _buildCell(BuildContext context, int index) {
  return SimpleFoldingCell(
    frontWidget: Container(
        color: Color(0xFFffcd3c),
        alignment: Alignment.center,
        child: Text("CARD - $index",
            style: TextStyle(
                color: Color(0xFF2e282a), fontFamily: 'OpenSans', fontSize: 20.0, fontWeight: FontWeight.w800))),
    innerTopWidget: Container(
        color: Color(0xFFff9234),
        alignment: Alignment.center,
        child: Text("TITLE - $index",
            style: TextStyle(
                color: Color(0xFF2e282a), fontFamily: 'OpenSans', fontSize: 20.0, fontWeight: FontWeight.w800))),
    innerBottomWidget: Container(
      color: Color(0xFFecf2f9),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FlatButton(onPressed: (){
          final snackBar = SnackBar(content: Text('Item $index clicked'), duration: Duration(milliseconds: 600),);
          Scaffold.of(context).showSnackBar(snackBar);
        }, child: Text("FoldingCell Demo",), textColor: Colors.white, color: Colors.indigoAccent, splashColor: Colors.white.withOpacity(0.5),),
      ),
    ),
    cellSize: Size(MediaQuery.of(context).size.width, 125),
    padding: EdgeInsets.all(15),
  );
}


```

