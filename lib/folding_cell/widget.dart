import 'dart:math';

import 'package:flutter/material.dart';

/// Folding Cell Widget
class SimpleFoldingCell extends StatefulWidget {
  SimpleFoldingCell(
      {Key key,
      @required this.frontWidget,
      @required this.innerTopWidget,
      @required this.innerBottomWidget,
      this.cellSize = const Size(100.0, 100.0),
      this.unfoldCell = false,
      this.skipAnimation = false,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      this.animationDuration = const Duration(milliseconds: 500),
      this.borderRadius = 0.0,
      this.onOpen,
      this.onClose})
      : assert(frontWidget != null),
        assert(innerTopWidget != null),
        assert(innerBottomWidget != null),
        assert(cellSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        innerWidget = null,
        super(key: key);

  SimpleFoldingCell.create(
      {Key key,
      @required this.frontWidget,
      @required this.innerWidget,
      this.cellSize = const Size(100.0, 100.0),
      this.unfoldCell = false,
      this.skipAnimation = false,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      this.animationDuration = const Duration(milliseconds: 500),
      this.borderRadius = 0.0,
      this.onOpen,
      this.onClose})
      : assert(frontWidget != null),
        assert(innerWidget != null),
        assert(cellSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        innerTopWidget = null,
        innerBottomWidget = null,
        super(key: key);

  // Front widget in folded cell
  final Widget frontWidget;

  /// Top Widget in unfolded cell
  final Widget innerTopWidget;

  /// Bottom Widget in unfolded cell
  final Widget innerBottomWidget;

  /// Inner widget in unfolded cell
  final Widget innerWidget;

  /// Size of cell
  final Size cellSize;

  /// If true cell will be unfolded when created, if false cell will be folded when created
  final bool unfoldCell;

  /// If true cell will fold and unfold without animation, if false cell folding and unfolding will be animated
  final bool skipAnimation;

  /// Padding around cell
  final EdgeInsetsGeometry padding;

  /// Animation duration
  final Duration animationDuration;

  /// Rounded border radius
  final double borderRadius;

  /// Called when cell fold animations completes
  final VoidCallback onOpen;

  /// Called when cell unfold animations completes
  final VoidCallback onClose;

  @override
  SimpleFoldingCellState createState() => SimpleFoldingCellState();
}

class SimpleFoldingCellState extends State<SimpleFoldingCell>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onOpen != null) widget.onOpen();
      } else if (status == AnimationStatus.dismissed) {
        if (widget.onClose != null) widget.onClose();
      }
    });

    if (widget.unfoldCell) {
      _animationController.value = 1;
      _isExpanded = true;
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _animationController.value * pi;
          final cellWidth = widget.cellSize.width;
          final cellHeight = widget.cellSize.height;

          return Padding(
            padding: widget.padding,
            child: Container(
              color: Colors.transparent,
              width: cellWidth,
              height: cellHeight + (cellHeight * _animationController.value),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.borderRadius),
                        topRight: Radius.circular(widget.borderRadius)),
                    child: Container(
                      width: cellWidth,
                      height: cellHeight,
                      child: widget.innerWidget != null
                          ? OverflowBox(
                              minHeight: cellHeight,
                              maxHeight: cellHeight * 2,
                              alignment: Alignment.topCenter,
                              child: ClipRect(
                                child: Align(
                                  heightFactor: 0.5,
                                  alignment: Alignment.topCenter,
                                  child: widget.innerWidget,
                                ),
                              ),
                            )
                          : widget.innerTopWidget,
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(pi),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius),
                            bottomRight: Radius.circular(widget.borderRadius)),
                        child: Container(
                          width: cellWidth,
                          height: cellHeight,
                          child: widget.innerWidget != null
                              ? OverflowBox(
                                  minHeight: cellHeight,
                                  maxHeight: cellHeight * 2,
                                  alignment: Alignment.topCenter,
                                  child: ClipRect(
                                    child: Align(
                                      heightFactor: 0.5,
                                      alignment: Alignment.bottomCenter,
                                      child: widget.innerWidget,
                                    ),
                                  ),
                                )
                              : widget.innerBottomWidget,
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(angle),
                    child: Opacity(
                      opacity: angle >= 1.5708 ? 0.0 : 1.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.borderRadius),
                            topRight: Radius.circular(widget.borderRadius)),
                        child: Container(
                          width: angle >= 1.5708 ? 0.0 : cellWidth,
                          height: angle >= 1.5708 ? 0.0 : cellHeight,
                          child: widget.frontWidget,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void toggleFold() {
    if (_isExpanded) {
      if (widget.skipAnimation) {
        _animationController.value = 0;
      } else {
        _animationController.reverse();
      }
    } else {
      if (widget.skipAnimation) {
        _animationController.value = 1;
      } else {
        _animationController.forward();
      }
    }
    _isExpanded = !_isExpanded;
  }
}
