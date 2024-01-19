import 'package:flutter/material.dart';
import 'package:tezda/config/colors.dart';
import 'package:tezda/pages/favourite/favourite.dart';
import 'package:tezda/pages/profile/user_profile.dart';

import '../homepage.dart';
import 'bottomsheetbutton.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  //bool isSelected = false;

  static const List<Widget> _bodyView = <Widget>[
    HomePage(),
    FavouritePage(),
    UserProfile(),
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  final List<String> _labels = ['Home', 'Favourite', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => false,
      child: Scaffold(
        body: Center(
          child: _bodyView.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              color: AppColor.white,
              child: TabBar(
                  onTap: (x) {
                    setState(() {
                      _selectedIndex = x;
                    });
                  },
                  labelColor: AppColor.primaryColor,
                  unselectedLabelColor:
                      AppColor.grey, // const Color(0xFFC4C4C4),

                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide.none,
                  ),
                  tabs: [
                    // Home icon
                    ButtomSheetButton(
                      imageUrl: 'assets/icons/home.svg',
                      isSelected: _selectedIndex == 0,
                      indicatorColor: _selectedIndex == 0
                          ? AppColor.primaryColor
                          : AppColor.darkGrey.withOpacity(0.6),
                      label: _labels[0],
                    ),

                    ButtomSheetButton(
                      imageUrl: "assets/icons/profile-circle.svg",
                      isSelected: _selectedIndex == 1,
                      indicatorColor: _selectedIndex == 1
                          ? AppColor.primaryColor
                          : AppColor.darkGrey.withOpacity(0.6),
                      label: _labels[1],
                    ),

                    ButtomSheetButton(
                      imageUrl: "assets/icons/user.svg",
                      isSelected: _selectedIndex == 2,
                      indicatorColor: _selectedIndex == 2
                          ? AppColor.primaryColor
                          : AppColor.darkGrey.withOpacity(0.6),
                      label: _labels[2],
                    ),
                  ],
                  controller: _tabController),
            ),
          ),
        ),
      ),
    );
  }
}
