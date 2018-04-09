import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daka_flutter_client/record/item/record.dart';
import 'package:daka_flutter_client/record/item/record_convertor.dart';

class RecordListPage extends StatefulWidget {

  @override
  RecordListPageState createState() => new RecordListPageState();
}

class RecordListPageState extends State<RecordListPage> {
  List<Record> records = [];
  RecordConvertor recordConvertor = new RecordConvertor();

  final _biggerFont = const TextStyle(fontSize: 22.0);

  AlertDialog alertDialog;

  @override
  void initState() {
    super.initState();
    getRecordListData();
  }

  @override
  Widget build(BuildContext context) {
    var content;
    if (records.isEmpty) {
      content = new Center (
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: records.length, itemBuilder: buildRecordItem,);
    }

    return content;
  }


  getRecordListData() async {
    String response = await createHttpClient().read(
        'http://127.0.0.1:8781/test');
    setState(() {
      records = recordConvertor.jsonToObjectArray(response);
    });
  }

  Widget buildAlertOptions(Record record) {
    return new Text('我是你的记录：' + record.title + ', 你要做操作对吧？');
  }

  Widget buildRecordItem(BuildContext context, int index) {
    Record record = records[index];
    String img;
    switch (record.type) {
      case 0:
        img = 'images/study.png';
        break;
      case 1:
        img = 'images/work.png';
        break;
      case 2:
        img = 'images/sport.png';
        break;
    }

    var titleStyle = new TextStyle(
      fontSize: 22.0,
    );

    var itemContainer = new Container(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),

      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.asset(img, width: 40.0, height: 40.0,),
          new Expanded(
              child: new Container(
                padding: const EdgeInsets.only(left: 12.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(record.title, style: titleStyle,),
                    new Text('1h')
                  ],
                ),
              )
          ),
        ],
      ),
    );

    var itemCard = new InkWell(
        onLongPress: () {
          alertDialog = new AlertDialog(
            title: new Text('提示'), content: buildAlertOptions(record),);
          showDialog(
              context: context, child: alertDialog, barrierDismissible: true);
        },
        child: new Container(
          margin: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 4.0, bottom: 4.0),
          child: new Card(
            color: Colors.white,
            child: itemContainer,
          ),

        )
    );


//    return new ListTile(
//      title: new Text(record.title, style: _biggerFont,),
//      trailing: new Icon(
//        Icons.mail, color: Colors.orange,
//      ),
//      onTap: () {
//        setState(() {
//
//        });
//      },
//      onLongPress: () {
//        alertDialog = new AlertDialog(title: new Text('提示'), content: buildAlertOptions(record),);
//        showDialog(context: context, child: alertDialog,barrierDismissible: true);
//      },
//    );
    return itemCard;
  }
}