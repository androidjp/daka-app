import 'package:daka_flutter_client/user/User.dart';
import 'package:meta/meta.dart';

class Record {
  String title;
  String duringTime;
  DateTime createDateTime;
  DateTime updateDateTime;
  int type;
  User user;

//  constructor
  Record({@required this.title,@required this.duringTime, @required this.type});

  @override
  String toString() {
    return 'Record{title: $title, duringTime: $duringTime, createDateTime: $createDateTime, updateDateTime: $updateDateTime, type: $type, user: $user}';
  }

}