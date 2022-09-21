
import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/back_end/number_formatter.dart';
import 'package:moma/back_end/transaction.dart';
import 'package:moma/main_app_screen/transaction_page/menu_item.dart';

import 'editing_page.dart';

class TransactionListTile extends StatefulWidget {
  TransactionListTile({
    Key? key,
    required this.text,
    required this.money,
    required this.icon,
    required this.subtext,
    required this.id,
    required this.appUser,
    this.longPress,
  }) : super(key: key);

  final int id;
  final Image icon;
  final String text;
  final String subtext;
  final VoidCallback? longPress;
  final int money;
  MomaUser appUser;

  @override
  State<TransactionListTile> createState() => _TransactionListTileState();
}

class _TransactionListTileState extends State<TransactionListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        leading: widget.icon,
        title: Text(
          widget.text,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(widget.subtext),
        trailing: SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  moneyFormat(widget.money),
                  style: const TextStyle(fontSize: 20),
                ),
                PopupMenuButton<MenuItem>(
                    icon: const Icon(Icons.arrow_drop_down_sharp),
                    onSelected: (item) => onSlected(context, item, widget.id),
                    itemBuilder: (context) =>
                    [
                      ...MenuItems.itemsList.map(buildItem).toList(),
                    ]),
              ],
            )));
  }

  void remove(int id) {
    widget.appUser.removeID(id);
    Navigator.pushReplacementNamed(context, '/main_screen');
  }

  void edit(int id){
    Transaction? newTransaction = widget.appUser.findID(id);
    if(newTransaction!= null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditingPage(
                appUser: widget.appUser,
                editingTransaction: newTransaction,
              )));
    }
  }

  void onSlected(BuildContext context, MenuItem item, int id) {
    switch (item) {
      case MenuItems.itemEdit:
        edit(id);
        break;
      case MenuItems.itemDelete:
        remove(id);
        break;
    }
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) =>
      PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            item.icon,
            const SizedBox(
              width: 12,
            ),
            item.text,
          ],
        ),
      );
}


