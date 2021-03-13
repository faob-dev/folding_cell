# Simple FoldingCell widget

Simple folding cell widget, pass `frontWidget` and `innerWidget` to fold and unfold.

[![pub package](https://img.shields.io/pub/v/folding_cell.svg)](https://pub.dartlang.org/packages/folding_cell)

## Installation

Add dependency in `pubspec.yaml`:
```yaml
dependencies:
  folding_cell: "^1.0.2"
```

Import in your project:
```dart
import 'package:folding_cell/folding_cell.dart';
```

## Basic usage

```dart
class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell.create(
        key: _foldingCellKey,
        frontWidget: _buildFrontWidget(),
        innerWidget: _buildInnerWidget(),
        cellSize: Size(MediaQuery.of(context).size.width, 140),
        padding: EdgeInsets.all(15),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('cell opened'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Color(0xFFffcd3c),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "CARD TITLE",
              style: GoogleFonts.aldrich(
                color: Color(0xFF2e282a),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "OPEN",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInnerWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "CARD TITLE",
              style: GoogleFonts.aldrich(
                color: Color(0xFF2e282a),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "CARD DETAIL",
              style: GoogleFonts.aldrich(
                color: Color(0xFF2e282a),
                fontSize: 40.0,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "Close",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```


## Examples

[example](https://github.com/faob-dev/folding_cell/tree/master/example) project contains these two demos

### Demo 1 - FoldingCell inside Container
![alt tag](https://raw.githubusercontent.com/faob-dev/folding_cell/master/screenshots/fc_demo1.gif)

### Demo 2 - FoldingCell inside ListView
![alt tag](https://raw.githubusercontent.com/faob-dev/folding_cell/master/screenshots/fc_demo2.gif)

## Changelog
Check [Changelog](https://github.com/faob-dev/folding_cell/blob/master/CHANGELOG.md) for updates

## Bugs/Requests
Reporting issues and requests for new features are always welcome.
