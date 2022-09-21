import 'package:moma/back_end/group_money.dart';
import 'package:moma/back_end/transaction.dart';

class MomaUser {
  late String gmail;
  late List<Transaction> transactions;
  int MAX_ID = 0;
  int currentMoney= 0;
  String uid="";

  MomaUser(String gmail) {
    this.gmail = gmail; 
    transactions = <Transaction>[];
  }

  void removeID(int ID) {
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].getID() == ID) {
        transactions.removeAt(i);
        //updateTransaction(transactions, uid);
        return;
      }
    }
  }

  Transaction? findID(int ID){
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].getID() == ID) {
        return transactions[i];
      }
    }
    return null;
  }

  void addTransaction(Transaction newTransaction) {
    newTransaction.setID(MAX_ID++);
    if (groupMoneyList[newTransaction.getGroupMoney()].type == INCOME) {
      currentMoney += newTransaction.getMoney();
    } else {
        currentMoney -= newTransaction.getMoney();
    }

    if(isTransactionEmpty()) {
      transactions.insert(0, newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    if (newTransaction.less(transactions[0])) {
      transactions.insert(0, newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    int length = transactions.length;
    if (transactions[length - 1].less(newTransaction)) {
      transactions.add(newTransaction);
      //updateTransaction(transactions, uid);
      return;
    }

    for(int i = 0; i < length-1; i++) {
      if(transactions[i].less(newTransaction) && newTransaction.less(transactions[i+1])) {
        transactions.insert(i + 1, newTransaction);
        //updateTransaction(transactions, uid);
        return;
      }
    }
  }

  int getCurrentMoney(){
    return currentMoney;
  }

  bool isTransactionEmpty() {
    return transactions.isEmpty;
  }

  void showTransactions(){
    //print(transactions[transactions.length-1]);
    for (Transaction i in transactions){
      print(i);
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    String res = gmail + '\n';
    for (int i = 0; i < transactions.length; i++) {
      res += transactions[i].toString();
    }
    return res;
  }
}