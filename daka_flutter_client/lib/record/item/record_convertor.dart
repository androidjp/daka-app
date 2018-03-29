import 'dart:convert';
import 'package:daka_flutter_client/base/base_convertor.dart';
import 'package:daka_flutter_client/record/item/record.dart';

class RecordConvertor extends BaseConvertor<Record> {

  @override
  Record fromMap(Map map) {
    Record result =  new Record(
        title: map['title'],type:map['type']
    );
    result.createDateTime = map['createDateTime'];
    result.updateDateTime = map['updateDateTime'];
    return result;
  }

}