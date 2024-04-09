// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:supplink/Home/drawer_pages/LanePages/plutogrid.dart';
import 'package:supplink/Home/drawer_pages/LanePages/tradeView.dart';

class LaneView extends StatefulWidget {
  const LaneView({super.key});

  @override
  State<LaneView> createState() => _LaneViewState();
}

class _LaneViewState extends State<LaneView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lane Works Data'),
        ),
        // drawer: Drawer(),
        body: Scaffold(
          appBar: TabBar(
            labelColor: Colors.black,
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.only(right: 1050, left: 10),
            labelStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
            tabs: [Tab(text: 'Supply Chain View'), Tab(text: 'Product View')],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3,
              child: TabBarView(children: [
                DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: TabBar(
                        labelColor: Colors.black,
                        // indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.amber,
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: 'Manufacture',
                          ),
                          Tab(
                            text: 'Supplier',
                          ),
                          Tab(
                            text: 'Retailer',
                          )
                        ]),
                    body: TabBarView(
                        children: [TradeView(), TradeView(), TradeView()]),
                  ),
                ),
                Center(
                  child: Text('Product view'),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
