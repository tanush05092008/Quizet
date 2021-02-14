import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget child;
  CustomAppBar(this.height, this.child);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: AnimatedContainer(
        child: ClipRRect(
          child: Container(
            color: Color(0xffB721FF),
            child: Container(
              alignment: Alignment.center,
              child: child,
            ),
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        duration: Duration(seconds: 1),
        height: this.height,
      ),
      preferredSize: preferredSize,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this.height);
}
