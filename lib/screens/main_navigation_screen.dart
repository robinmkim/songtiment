import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:songtiment/constants/sizes.dart';
import 'package:songtiment/router.dart';
import 'package:songtiment/screens/home_screen.dart';
import 'package:songtiment/screens/profile_screen.dart';
import 'package:songtiment/widgets/nav_tab.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({super.key, required this.tab});

  @override
  ConsumerState<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  final List<String> _tabs = ["home", "post", "profile"];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: HomeScreen(onTap: _onTap),
          ),
          Offstage(
            offstage: _selectedIndex != 0,
            child: ProfileScreen(onTap: _onTap),
          ),
          Offstage(
            offstage: _selectedIndex != 0,
            child: ProfileScreen(onTap: _onTap),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                    text: "Home",
                    isSelected: _selectedIndex == 0,
                    icon: FontAwesomeIcons.house,
                    onTap: () => _onTap(0),
                    selectedIcon: FontAwesomeIcons.house,
                    selectedIndex: _selectedIndex),
                NavTab(
                    text: "Home",
                    isSelected: _selectedIndex == 0,
                    icon: FontAwesomeIcons.house,
                    onTap: () => _onTap(0),
                    selectedIcon: FontAwesomeIcons.house,
                    selectedIndex: _selectedIndex),
                NavTab(
                    text: "Profile",
                    isSelected: _selectedIndex == 2,
                    icon: FontAwesomeIcons.user,
                    onTap: () => _onTap(2),
                    selectedIcon: FontAwesomeIcons.solidUser,
                    selectedIndex: _selectedIndex)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
