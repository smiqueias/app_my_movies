import 'package:flutter/material.dart';

import 'navigation_list_drawer.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<String> children;

  const NavigationExpandedListItem({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            )
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          children: [
            for (int i = 0; i < children.length; i++)
              NavigationListItem(
                title: children[i],
                onPressed: () {},
              )
          ],
        ),
      ),
    );
  }
}
