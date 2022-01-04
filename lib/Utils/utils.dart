// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
        // ignore: deprecated_member_use
        ..removeCurrentSnackBar()
        // ignore: deprecated_member_use
        ..showSnackBar(SnackBar(content: Text(text)));

  static DateTime? toDateTime(Timestamp value) {
    // ignore: unnecessary_null_comparison
    if (value == null) return null;
    return value.toDate();
  }

  static dynamic dateToJson(DateTime date) {
    // ignore: unnecessary_null_comparison
    if (date == null) return null;

    return date.toUtc();
  }

  static StreamTransformer<QuerySnapshot, List<T>> transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          sink.add(data.docs.map((doc) => fromJson(doc.data())).toList());
        },
      );
}
