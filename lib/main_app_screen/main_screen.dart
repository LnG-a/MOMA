
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';

import 'transaction_page/transaction_page.dart';
import 'reporting_page/reporting_page.dart';
import 'adding_page/adding_page.dart';
import 'planning_menu/planning_page.dart';
import 'account_page/account_page.dart';

class MainScreen extends StatefulWidget {
  MomaUser appUser;

  MainScreen({Key? key, required this.appUser}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState(appUser);
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  late MomaUser appUser;
  late final screens;

  _MainScreenState(this.appUser){
    screens = [
      TransactionPage(appUser: appUser,),
      ReportingPage(appUser: appUser),
      AddingPage(appUser: appUser),
      PlanningPage(appUser: appUser),
      AccountPage(appUser: appUser),
    ];
  }

  final navigationKey = GlobalKey<CurvedNavigationBarState>();


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: SafeArea(
            top: false,
            child: ClipRect(
                child: Scaffold(
                    extendBody: true,
                    backgroundColor: Colors.white,
                    body: screens[_index],
                    bottomNavigationBar: Theme(
                      data: Theme.of(context).copyWith(
                        iconTheme: const IconThemeData(color: Colors.white),
                      ),
                      child: CurvedNavigationBar(
                        key: navigationKey,
                        backgroundColor: Colors.transparent,
                        color: Colors.black,
                        height: 60,
                        animationCurve: Curves.easeInOut,
                        animationDuration: const Duration(milliseconds: 500),
                        items: const [
                          Icon(Icons.account_balance_wallet, size: 30,),
                          Icon(Icons.bar_chart, size: 30,),
                          Icon(Icons.add, size: 30,),
                          Icon(Icons.savings, size: 30,),
                          Icon(Icons.person, size: 30,),
                        ],
                        onTap: _changeItem,
                        index: _index,
                      ),
                    )
                ))
        )
    );
  }

  void _changeItem(int value) {
    setState(() {
      _index = value;
    });
  }
}
