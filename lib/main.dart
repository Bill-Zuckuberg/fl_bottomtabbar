import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom tab bag',
      home: BottomTabBar(),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBar();
}

class _BottomTabBar extends State<BottomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const _kTabPages = [
    Center(
      child: Icon(
        Icons.cloud,
        size: 64,
        color: Colors.teal,
      ),
    ),
    Center(
      child: Icon(
        Icons.alarm,
        size: 64,
        color: Colors.cyan,
      ),
    ),
    Center(
      child: Icon(
        Icons.forum,
        size: 64,
        color: Colors.blue,
      ),
    )
  ];

  static const _kTabs = [
    Tab(
      icon: Icon(Icons.cloud),
      text: 'Tab',
    ),
    Tab(
      icon: Icon(Icons.alarm),
      text: 'Tab2',
    ),
    Tab(
      icon: Icon(Icons.forum),
      text: 'Tab3',
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _kTabPages.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: _kTabs,
        ),
      ),
    );
  }
}
