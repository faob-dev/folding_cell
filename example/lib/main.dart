import 'package:example/demos/demos_new.dart';
import 'package:flutter/material.dart';

/*
  Old examples are in `demos_old.dart`;
 */

void main() => runApp(
      MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: Material(
              child: FoldingCellSimpleDemo(),
            ),
          ),
        ),
      ),
    );
