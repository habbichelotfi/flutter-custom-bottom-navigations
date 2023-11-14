import 'package:flutter/material.dart';

class RoundedBottomNavigationBar extends StatelessWidget {
  final int pageIdx;
  final List<String> listItems;
  final List listOfIcons;

  final Function(int) onTap;

  const RoundedBottomNavigationBar(
      {super.key,
      required this.pageIdx,
      required this.listItems,
      required this.listOfIcons,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(
            top: displayWidth * .05,
            bottom: displayWidth * .08,
            left: displayWidth * .13,
            right: displayWidth * .13),
        height: displayWidth * .155,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 10))
            ],
            borderRadius: BorderRadius.circular(50)),
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
            itemBuilder: (context, index) => InkWell(
                onTap: (){
                  onTap(index);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(children: [
                  AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == pageIdx
                          ? displayWidth * .36
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == pageIdx ? displayWidth * .12 : 0,
                          width: index == pageIdx ? displayWidth * .32 : 0,
                          decoration: BoxDecoration(
                              color: index == pageIdx
                                  ? Colors.blueAccent.withOpacity(.2)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50)))),
                  AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == pageIdx
                          ? displayWidth * .31
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: Stack(children: [
                        Row(children: [
                          AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == pageIdx ? displayWidth * .13 : 0),
                          AnimatedOpacity(
                              opacity: index == pageIdx ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                  index == pageIdx ? '${listItems[index]}' : '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14)))
                        ]),
                        Row(children: [
                          AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width:
                                  index == pageIdx ? displayWidth * .03 : 20),
                          Image.asset(listOfIcons[index],
                              width: displayWidth * .070)
                        ])
                      ]))
                ]))));
  }
}
