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
