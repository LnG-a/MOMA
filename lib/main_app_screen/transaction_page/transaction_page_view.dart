import 'package:flutter/cupertino.dart';
import 'package:moma/back_end/group_money.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/back_end/transaction.dart';
import 'package:moma/main_app_screen/transaction_page/transaction_list_tile.dart';

class TransactionPageView extends StatefulWidget {
  DateTime dateTime;
  MomaUser appUser;
  late List<Transaction> transactionsByMonth = transactionByMonth();

  TransactionPageView({Key? key,required this.dateTime,required this.appUser}) : super(key: key);

  @override
  State<TransactionPageView> createState() => _TransactionPageViewState();

  List<Transaction> transactionByMonth() {
    List<Transaction> newList = List<Transaction>.from(appUser.transactions);
    for (int i=0;i<newList.length;i++){
      if(newList[i].time.month!= dateTime.month || newList[i].time.year!= dateTime.year){
        newList.removeAt(i);
        i--;
      }
    }
    return newList;
  }
}

class _TransactionPageViewState extends State<TransactionPageView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.transactionsByMonth.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionListTile(
            text: groupMoneyList[widget.transactionsByMonth[index].group_money].name,
            money: widget.transactionsByMonth[index].money,
            icon: groupMoneyList[widget.transactionsByMonth[index].group_money].icon,
            subtext: "${widget.appUser.transactions[index].time.day}/${widget.transactionsByMonth
            [index].time.month}/${widget.transactionsByMonth[index].time
                .year}",
            id: widget.appUser.transactions[index].ID,
            appUser: widget.appUser,
          );
        }
    );
  }

}