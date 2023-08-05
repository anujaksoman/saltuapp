import 'package:flutter/material.dart';
import 'package:saltuapp/view/widget/about_widget.dart';
import 'package:saltuapp/view/widget/character_widget.dart';
import 'package:saltuapp/view/widget/legends_widget.dart';
import 'package:saltuapp/view/widget/search_widget.dart';

class MyDesktopBody extends StatefulWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  _MyDesktopBodyState createState() => _MyDesktopBodyState();
}

class _MyDesktopBodyState extends State<MyDesktopBody> with TickerProviderStateMixin{
  late TabController tabController ;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    // tabController.animateTo(2);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Column(
              children: [
                TabBar(

                  controller: tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.normal),
                  indicatorColor: Colors.white,
                  dividerColor: Colors.transparent,
                  //indicatorPadding: const EdgeInsets.all(5),

                  tabs: [
                    // Put Tabs here
                    Tab(text: "Characters",),
                    Tab(text: "Legend",),
                    Tab(text: "About",),
                  ],
                ),

                SearchWidget(),
              ],
            )
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text('Home',style: TextStyle(color: Colors.white),),
             Text('Refresh',style: TextStyle(color: Colors.black),)
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          CharacterWidget(),
          LegendsWidget(),
          AboutWidget()
        ],
      ),
    );
  }
}
