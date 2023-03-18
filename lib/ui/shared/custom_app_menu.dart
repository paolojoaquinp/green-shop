import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_shop/locator.dart';
import 'package:green_shop/services/navigation_service.dart';

class CustomAppMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return (constraints.maxWidth > 520) ? _TabletDesktopMenu() : _MobileMenu();
      },
    );
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  const _TabletDesktopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logos/nav-logo.svg',
            width: 40,
          ),
          _NavItem('All','/home'),
          _NavItem('Locations','/12123'),
          _NavItem('Electronics','asjdfnakj'),
          _NavItem('About','/about'),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,5.0)
          )
        ]
      ),
    );
  }
}
class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logos/nav-logo.svg',
            width: 40,
          ),
          _NavItem('All','/home'),
          _NavItem('Locations','/12123'),
          _NavItem('Electronics','asjdfnakj'),
          _NavItem('About','/about'),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,5.0)
          )
        ]
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final String route;
  _NavItem(this.label, this.route);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        locator<NavigationService>().navigateTo(route);
      },
      child: Text(label,style: TextStyle(color: Colors.grey),),
    );
  }
}