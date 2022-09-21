
import 'package:flutter/material.dart';
import 'package:moma/back_end/group_money.dart';


class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return groupMoneyListTileWidget(
            groupMoney: index+1,
            onSelectedGroup: (int groupMoney){
              Navigator.pop(context,groupMoney);
            },
          );
        },
        itemCount: 12,
        ),

    );
  }
}

class groupMoneyListTileWidget extends StatelessWidget {
  final int groupMoney;
  final ValueChanged<int> onSelectedGroup;

  const groupMoneyListTileWidget({Key? key,required this.groupMoney, required this.onSelectedGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading:  groupMoneyList[groupMoney].icon,
      onTap: () => onSelectedGroup(groupMoney),
      title: Text(groupMoneyList[groupMoney].name, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
    );
  }
}


