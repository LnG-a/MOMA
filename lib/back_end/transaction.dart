
/*
 * use DateTime
 */
import 'dart:core';
import 'group_money.dart';

class Transaction {
  late int ID;
  late int money;
  late DateTime time;
  late int group_money;
  late String note;

  Transaction(int money, DateTime time, int groupMoney, String note) {
    ID = -1;
    this.money = money;
    this.note = note;
    this.time = time;
    group_money = groupMoney;
  }
  int getID() {
    return ID;
  }

  int getMoney() {
    return money;
  }

  int getGroupMoney() {
    return group_money;
  }

  String getNote() {
    return note;
  }

  DateTime getTime() {
    return time;
  }

  void setID(int ID) {
    this.ID = ID;
  }

  void setMoney(int money) {
    this.money = money;
  }

  void setGroupMoney(int groupMoney) {
    group_money = groupMoney;
  }

  void setNote(String note) {
    this.note = note;
  }

  void setTime(DateTime time) {
    this.time = time;
  }

  bool less(Transaction other) {
    return time.isBefore(other.getTime());
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (other is Transaction) {
      if(other.getMoney() == getMoney()) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "["+ID.toString()
        +","
        + groupMoneyList[group_money].name +
        ", " +
        money.toString() +
        ", " +
        time.toString() +
        ", " +
        note +"]";
  }




}

void swapTransaction(Transaction a, Transaction b) {
  Transaction temp = a;
  a = b;
  b = temp;
}

