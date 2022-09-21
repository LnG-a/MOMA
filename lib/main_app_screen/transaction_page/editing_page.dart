
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moma/back_end/group_money.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/back_end/number_formatter.dart';
import 'package:moma/back_end/transaction.dart';
import 'package:moma/main_app_screen/adding_page/selection_page.dart';

class EditingPage extends StatefulWidget {
  MomaUser appUser;
  Transaction editingTransaction;
  EditingPage({Key? key,required this.appUser, required this.editingTransaction}) : super(key: key);

  @override
  State<EditingPage> createState() => _EditingPageState(editingTransaction);
}

class _EditingPageState extends State<EditingPage> {

  Transaction editingTransaction;
  late DateTime date;
  late int groupMoney;

  final TextEditingController moneyController= TextEditingController();
  final TextEditingController noteController= TextEditingController();

  _EditingPageState(this.editingTransaction){
    date=editingTransaction.time;
    groupMoney= editingTransaction.group_money;
    moneyController.text=moneyFormat(editingTransaction.money);
    noteController.text=editingTransaction.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F6F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: (const Text(
              "Editing Transaction", style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check, color: Colors.black,),
              onPressed: () {
                setState(() {
                  editingTransaction.group_money=groupMoney;
                  editingTransaction.time=date;
                  editingTransaction.money=int.parse(moneyController.text.replaceAll(RegExp('[^0-9]'), ''));
                  editingTransaction.note=noteController.text;
                  Navigator.pushReplacementNamed(context,'/main_screen');
                });
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 30, bottom: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: moneyController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ThousandsFormatter(),
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on,color: Colors.black,size: 32,),
                      hintText: '0',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(left: 13),
                    ),
                    child: Row(
                      children: [
                        groupMoneyList[groupMoney].icon,
                        const SizedBox(width: 10),
                        Text(groupMoneyList[groupMoney].name
                            ,style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                    onPressed: () async {
                      final newGroupMoney = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SelectionScreen()));
                      if (newGroupMoney!=null) {
                        setState(() {
                        groupMoney = newGroupMoney;
                      });
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.notes,color: Colors.black,size: 32,),
                      hintText: 'Note',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      border: InputBorder.none,
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.black),
                      // )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(left: 13),

                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined,size: 32,),
                        const SizedBox(width: 10),
                        Text('${date.day}/${date.month}/${date.year}',style: const TextStyle(fontSize: 15,),)
                      ],
                    ),
                    onPressed: () async {
                      DateTime? newDate= await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate:DateTime(2000),
                        lastDate: DateTime(2099),
                      );
                      if (newDate!=null) {
                        setState(() =>date=newDate);
                      }
                    },
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}

