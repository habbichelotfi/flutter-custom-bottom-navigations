import 'package:flutter/material.dart';

import '../../nav_item.dart';
class CurvedNavigationBar extends StatefulWidget {
  @override
  _CurvedNavigationBarState createState() => _CurvedNavigationBarState();
}
class CurvedNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 10);
    path.arcToPoint(Offset(size.width * 0.60, 10),
        radius: Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.6, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedNavigationBarPainter(),
      child: Container(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navItems.length, (index) {
            NavItem currentItem = navItems[index];
            return IconButton(
              icon: Icon(currentItem.icon, color: selectedIndex == index ? currentItem.color : Colors.grey),
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
                // Handle navigation onTap
              },
            );
          }),
        ),
      ),
    );
  }
}
