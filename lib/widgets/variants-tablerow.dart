import 'package:flutter/material.dart';

dynamic buildVariants(Map<String, dynamic> variants,[bool showAllKeys=false]) {
  final list = [];
  final blockKeys = ['cbmWeight','cbmHeight','cbmWidth','cbmLength','volumetricWeight','price'];
  variants?.forEach((key, value) {
    if(!blockKeys.contains(key)) {
      list.add(TableRow(children: [
      Text(key,
          style: TextStyle(
            height: 1.6,
            fontSize: 13,
            color: Colors.grey,
          )),
      Text(value,
          style: TextStyle(color: Color(0xFF313F53)),
          textAlign: TextAlign.right)
    ]));
    }
  });
  return list;
}