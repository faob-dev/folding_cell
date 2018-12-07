# Simple FoldingCell widget

Simple folding cell widget implemented in Flutter. Its a widget so add it to any container widget as a child.

## Installation

Add dependency in `pubspec.yaml`:
```yaml
dependencies:
  folding_cell: "^0.1.0"
```

Import in your project
```dart
import 'package:folding_cell/folding_cell.dart';
```

## Basic usage

```dart
class FoldingCellSimpleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell(
        frontWidget: Container(
            color: Color(0xFFffcd3c),
            alignment: Alignment.center,
            child: Text("CARD",
                style: TextStyle(
                    color: Color(0xFF2e282a), fontFamily: 'OpenSans', fontSize: 20.0, fontWeight: FontWeight.w800))),
        innerTopWidget: Container(
            color: Color(0xFFff9234),
            alignment: Alignment.center,
            child: Text("TITLE",
                style: TextStyle(
                    color: Color(0xFF2e282a), fontFamily: 'OpenSans', fontSize: 20.0, fontWeight: FontWeight.w800))),
        innerBottomWidget: Container(
          color: Color(0xFFecf2f9),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: FlatButton(onPressed: (){
              final snackBar = SnackBar(content: Text('Item clicked'), duration: Duration(milliseconds: 600),);
              Scaffold.of(context).showSnackBar(snackBar);
            }, child: Text("FoldingCell Demo",), textColor: Colors.white, color: Colors.indigoAccent, splashColor: Colors.white.withOpacity(0.5),),
          ),
        ),
        cellSize: Size(MediaQuery.of(context).size.width, 125),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
```

