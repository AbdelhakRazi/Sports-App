import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sport_app/Provider_managment/GoogleSignIn.dart';
import 'package:sport_app/config/colors.dart';
import 'package:sport_app/views/screens/Home%20screens/TabWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollviewcontroller.dispose();
  }

  TabController _tabController;
  ScrollController _scrollviewcontroller;
  int _selectedIndex = 0;
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollviewcontroller = ScrollController();
  }

  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
              child: Align(
                alignment: Alignment(-0.7, 0),
                child: Text(
                  'Menu',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 30),
                ),
              ),
            ),
            SizedBox(height: screen_height * 0.1),
            ListTile(
              leading: Icon(
                Icons.star_border,
                color: AppColors.blue,
                size: 35,
              ),
              title: Text(
                'Premium',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: AppColors.blue),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: screen_height * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: AppColors.blue,
                size: 35,
              ),
              title: Text(
                'Settings',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: AppColors.blue),
              ),
              onTap: () {},
            ),
            SizedBox(
              height: screen_height * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: AppColors.blue,
                size: 35,
              ),
              title: Text(
                'Log out',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: AppColors.blue),
              ),
              onTap: () {
                Provider.of<GoogleSign>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, indx) {
                return [
                  SliverToBoxAdapter(
                      child: SizedBox(
                    height: screen_height * 0.04,
                  )),
                  SliverToBoxAdapter(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: AppColors.blue,
                        size: 35,
                      ),
                      onPressed: () {
                        _key.currentState.openDrawer();
                      },
                    ),
                  )),
                  SliverToBoxAdapter(
                      child: SizedBox(height: screen_height * 0.02)),
                  SliverToBoxAdapter(
                    child: Text("Training of any\nDifficulty Level",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: screen_height * 0.03,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: AppColors.blue,
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      indicator: BoxDecoration(
                          color: AppColors.bright_yellow,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: AppColors.white, width: 1)),
                      tabs: [
                        Tab(
                          text: "Beginner",
                        ),
                        Tab(text: "Intermediate"),
                        Tab(
                          text: "Advanced",
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: EdgeInsets.only(right: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TabWidget(),
                    TabWidget(),
                    TabWidget(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(0, 3),
                    color: AppColors.black.withOpacity(0.16))
              ]),
              child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: AppColors.white,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: bottomnavbar())),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar bottomnavbar() {
    return BottomNavigationBar(
      elevation: 7,
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.blue,
      showSelectedLabels: false,
      onTap: (index) {
        setState(() {
          this._selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            label: '.',
            activeIcon: Column(children: [
              Icon(
                Icons.home,
                size: 30,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blue,
                minRadius: 3,
              )
            ]),
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            )),
        BottomNavigationBarItem(
            activeIcon: Column(children: [
              Icon(
                Icons.favorite,
                size: 30,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blue,
                minRadius: 3,
              )
            ]),
            label: '.',
            icon: Icon(
              Icons.favorite_border,
              size: 30,
            )),
        BottomNavigationBarItem(
            label: '.',
            activeIcon: Column(children: [
              Icon(
                Icons.shopping_bag,
                size: 30,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blue,
                minRadius: 3,
              )
            ]),
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            )),
        BottomNavigationBarItem(
            label: '.',
            activeIcon: Column(children: [
              Icon(
                Icons.person,
                size: 30,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blue,
                minRadius: 3,
              )
            ]),
            icon: Icon(
              Icons.person_outline,
              size: 30,
            )),
      ],
    );
  }
}
