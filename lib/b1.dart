import 'package:first_flutter/t1.dart';
import 'package:first_flutter/t2.dart';
import 'package:flutter/material.dart';

class B1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        children: <Widget>[
          TabBar(
            isScrollable: true,
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 6.0,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Tab(
                  text: 'Tab 1',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Tab(
                  text: 'Tab 1',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Tab(
                  text: 'Tab 1',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Tab(
                  text: 'Tab 1',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Tab(
                  text: 'Tab 1',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Tab(
                  text: 'Tab 1',
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
                children: <Widget>[
                  T1Screen(),
                  T2Screen(),
                  T1Screen(),
                  T2Screen(),
                  T1Screen(),
                  T2Screen(),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
