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
      content =new Center (
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(itemCount:records.length,itemBuilder: buildRecordItem,);
    }

    return content;
  }


  getRecordListData() async{
    String response = await createHttpClient().read('');
    setState(() {
      records = recordConvertor.jsonToObjectArray(response);
    });
  }

  Widget buildAlertOptions(Record record) {
    return new Text('我是你的记录：' + record.title + ', 你要做操作对吧？');
  }

  Widget buildRecordItem(BuildContext context, int index) {
    Record record = records[index];

    return new ListTile(
      title: new Text(record.title, style: _biggerFont,),
      trailing: new Icon(
        Icons.mail, color: Colors.orange,
      ),
      onTap: () {
        setState(() {

        });
      },
      onLongPress: () {
        alertDialog = new AlertDialog(title: new Text('提示'), content: buildAlertOptions(record),);
        showDialog(context: context, child: alertDialog,barrierDismissible: true);
      },
    );
  }
}