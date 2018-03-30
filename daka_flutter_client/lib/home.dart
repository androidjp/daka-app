import 'package:flutter/material.dart';
import 'package:daka_flutter_client/record/list/record_list.dart';
import 'package:daka_flutter_client/components/icon_tab.dart';

const TAB_TEXT_SIZE = 11.0;

const INDEX_MINE = 0;
const INDEX_HER = 1;

class DakaApp extends StatefulWidget {
  @override
  createState() => new HomeState();

}

//SingleTickerProviderStateMixin 是啥？
class HomeState extends State<DakaApp> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;
  TabController _tabController;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
        initialIndex: _currentIndex,
        length: 2, vsync: this
    );
    onChanged = () {
      setState(() {
        _currentIndex = this._tabController.index;
      });
    };

    _tabController.addListener(onChanged);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new RecordListPage(),new RecordListPage()
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: new TextStyle(fontSize: TAB_TEXT_SIZE),
            tabs: <IconTab>[
              new IconTab(
                  icon: new Icon(
                    this._currentIndex == INDEX_MINE ? Icons.person : Icons
                        .person_outline,
                    color: this._currentIndex == INDEX_MINE ? Colors.blue : Colors
                        .grey
                  ),
                  text: '我的',
                  color: this._currentIndex == INDEX_MINE ? Colors.blue : Colors
                      .grey
              ),
              new IconTab(
                  icon: new Icon(
                      this._currentIndex == INDEX_HER ? Icons.people : Icons
                          .people_outline,
                      color: this._currentIndex == INDEX_HER ? Colors.blue : Colors
                      .grey
                  ),
                  text: '对方',
                  color: this._currentIndex == INDEX_HER ? Colors.blue : Colors
                      .grey
              )
            ]
        ),
      ),
    );
  }
}