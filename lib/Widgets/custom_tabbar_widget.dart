import 'package:flutter/material.dart';
import '../Theme/AppStyles.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabItem(
            label: "Home",
            icon: Icons.home,
            selected: currentSelected == 0,
            onTapCallback: () {
              setState(() {
                currentSelected = 0;
              });
            },
          ),
          TabItem(
            label: "Profile",
            icon: Icons.person,
            selected: currentSelected == 1,
            onTapCallback: () {
              setState(() {
                currentSelected = 1;
              });
            },
          ),
          TabItem(
            label: "Saved",
            icon: Icons.bookmark,
            selected: currentSelected == 2,
            onTapCallback: () {
              setState(() {
                currentSelected = 2;
              });
            },
          ),
          TabItem(
            label: "Recipes",
            icon: Icons.sort,
            selected: currentSelected == 3,
            onTapCallback: () {
              setState(() {
                currentSelected = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Function onTapCallback;

  const TabItem({
    Key key,
    this.label,
    this.icon,
    this.selected,
    this.onTapCallback,
  }) : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.selected ? 125 : 50,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: widget.selected ? AppStyles.primaryColor : null,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              color: widget.selected ? Colors.white : AppStyles.textColorAlpha,
              icon: Icon(widget.icon),
              onPressed: () => widget.onTapCallback(),
            ),
            if (widget.selected)
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                opacity: widget.selected ? 1 : 0,
                child: Text(
                  "${widget.label}",
                  style: TextStyle(
                    fontFamily: 'firasans',
                    color: widget.selected
                        ? Colors.white
                        : AppStyles.textColorAlpha,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
