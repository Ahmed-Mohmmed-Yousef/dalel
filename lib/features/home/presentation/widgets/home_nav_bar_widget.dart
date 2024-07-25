import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

final PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarItems(),
      screens: _buildScreens(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        colorBehindNavBar: Colors.white,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CartView(),
      const SearchView(),
      const ProfileView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.icHome),
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.icCart),
        title: "Cart",
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.icSearch),
        title: "Search",
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.icPerson),
        title: "Profile",
      ),
    ];
  }
}
