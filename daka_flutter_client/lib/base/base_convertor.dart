import 'package:flutter/material.dart';
import 'dart:convert';

abstract class BaseConvertor<T> {

  List<T> jsonToObjectArray(String jsonStr){
    return JSON
        .decode(jsonStr)['subjects']
        .map((obj) => fromMap(obj))
        .toList();
  }

  T fromMap(Map map);
}