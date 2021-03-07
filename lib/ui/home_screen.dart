import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'assets_screen.dart';
import 'summary_screen.dart';
import 'debt_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Tab> _tabList = [
    Tab(
      icon: Icon(Icons.account_balance),
      text: 'Summary',
    ),
    Tab(
      icon: Icon(Icons.add_circle_outline),
      text: 'Assets',
    ),
    Tab(icon: Icon(Icons.remove_circle_outline), text: 'Debt')
  ];
  final List<Widget> _tabViewList = [SummaryScreen(), AssetsScreen(), DebtScreen()];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabViewList.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backwardsCompatibility: false,
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).accentColor),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabList,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabViewList,
      ),
    );
  }
}
