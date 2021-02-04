import 'package:app_my_movies/common/constants/size_constants.dart';
import 'package:app_my_movies/presentation/screens/drawer/navigation_list_drawer.dart';
import 'package:app_my_movies/presentation/widgets/logo.dart';
import 'package:app_my_movies/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import 'navigation_expanded_list_drawer.dart';

class NavegationDrawer extends StatelessWidget {
  const NavegationDrawer();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          )
        ],
      ),
      width: Sizes.dimen_300.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Sizes.dimen_8.h,
              bottom: Sizes.dimen_18.h,
              left: Sizes.dimen_8.w,
              right: Sizes.dimen_8.w,
            ),
            child: LogoWidget(
              height: Sizes.dimen_20.h,
            ),
          ),
          NavigationListItem(
            title: 'Favorite Movies',
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            children: [
              'English',
              'Spanish',
            ],
            title: 'Language',
            onPressed: () {},
          ),
          NavigationListItem(
            title: 'Feedback',
            onPressed: () {},
          ),
          NavigationListItem(
            title: 'About',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
