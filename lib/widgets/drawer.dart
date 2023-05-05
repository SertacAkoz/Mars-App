// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';

import 'package:mars_app/inheritance/mars_style.dart';
import 'package:mars_app/utils/utils.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  final MarsStyle style;
  const AppDrawer({
    Key? key,
    required this.child,
    required this.style,
  }) : super(key: key);

  static _AppDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(controller: _controller, style: widget.style),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  AnimationController controller;
  final MarsStyle style;
  CustomDrawer({
    Key? key,
    required this.controller,
    required this.style,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isExpandedRadevuIslemleri = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.style.primaryColor(),
      // color: Color(0xff5956E9),
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  // padding: const EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset('assets/images/mars.jpeg'),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Utils.navigate(navigationPath: '/assetList', context: context);
                },
                child: const ListTile(
                  leading: Icon(Icons.list_alt_rounded),
                  title: Text('Assets'),
                ),
              ),
              const SizedBox(
                width: 206,
                child: Padding(
                  padding: EdgeInsets.only(left: 74, right: 0),
                  child: Divider(
                    color: Color(0xfff4f4f8),
                    height: 0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Utils.navigate(navigationPath: '/assetAdd', context: context);
                },
                child: const ListTile(
                  leading: Icon(Icons.add_rounded),
                  title: Text('Add Asset'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
