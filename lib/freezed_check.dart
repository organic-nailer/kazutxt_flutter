import 'dart:convert';

import 'package:kazutxt_flutter/user.dart';

void func() {
  User user1 = User("fastriver", 30);
  User user2 = User("fastriver2", 32);
  User user3 = User("fastriver", 30);

  print("check1");
  print(user1);

  print("check2");
  if (user1 == user2) print("user1とuser2は同じ人");
  if (user1 == user3) print("user1とuser3は同じ人");

  print("check3");
  User user4 = user1.copyWith(name: "unknown");
  print(user1);
  print(user4);

  print("check4");
  user2 = user3;
  print(user2);

  // user1.name = "unknown";
}

void func2() {
  String jsonString = '{"name":"fastriver","age":30}';
  User fromJsonUser = User.fromJson(json.decode(jsonString));
  print(fromJsonUser);

  User toJsonUser = User("fastriver2", 32);
  var jsonData = toJsonUser.toJson();
  print(jsonData);
}
