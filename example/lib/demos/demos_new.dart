import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:google_fonts/google_fonts.dart';

/// Example 1 folding cell inside [Container]
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

/// Example 2 Multiple folding cells inside [Column]
class FoldingCellMultipleCardsDemo extends StatelessWidget {
  final _foldingCellKey1 = GlobalKey<SimpleFoldingCellState>();
  final _foldingCellKey2 = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      child: Column(
        children: <Widget>[
          SimpleFoldingCell.create(
            key: _foldingCellKey1,
            frontWidget: _buildFrontWidget(_foldingCellKey1, "CARD 1"),
            innerWidget: _buildInnerWidget(_foldingCellKey1),
            cellSize: Size(MediaQuery.of(context).size.width, 140),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('cell 1 opened'),
            onClose: () => print('cell 1 closed'),
          ),
          SimpleFoldingCell.create(
            key: _foldingCellKey2,
            frontWidget: _buildFrontWidget(_foldingCellKey2, "CARD 2"),
            innerWidget: _buildInnerWidget(_foldingCellKey2),
            cellSize: Size(MediaQuery.of(context).size.width, 125),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('cell 2 opened'),
            onClose: () => print('cell 2 closed'),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontWidget(
      GlobalKey<SimpleFoldingCellState> key, String title) {
    return Container(
      color: Color(0xFFffcd3c),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
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
              onPressed: () => key?.currentState?.toggleFold(),
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

  Widget _buildInnerWidget(GlobalKey<SimpleFoldingCellState> key) {
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
              onPressed: () => key?.currentState?.toggleFold(),
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

/// Example 3 folding cell inside [ListView]
class FoldingCellListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return SimpleFoldingCell.create(
            frontWidget: _buildFrontWidget(index),
            innerWidget: _buildInnerWidget(index),
            cellSize: Size(MediaQuery.of(context).size.width, 125),
            padding: EdgeInsets.all(15),
            animationDuration: Duration(milliseconds: 300),
            borderRadius: 10,
            onOpen: () => print('$index cell opened'),
            onClose: () => print('$index cell closed'),
          );
        },
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFFffcd3c),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "CARD - $index",
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
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
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
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          color: Color(0xFFecf2f9),
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "CARD TITLE - $index",
                  style: GoogleFonts.aldrich(
                    color: Color(0xFF2e282a),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "CARD DETAIL - $index",
                  style: GoogleFonts.aldrich(
                    color: Color(0xFF2e282a),
                    fontSize: 32.0,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: TextButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
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
      },
    );
  }
}
