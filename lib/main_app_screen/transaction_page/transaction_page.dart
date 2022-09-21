
import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/back_end/number_formatter.dart';
import 'package:moma/main_app_screen/transaction_page/transaction_page_view.dart';


class TransactionPage extends StatefulWidget {
  MomaUser appUser;
  TransactionPage({Key? key,required this.appUser}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late DateTime date = DateTime.now();
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  DateTime dateCount(DateTime dateTime, int index){
    int newTimeMonth=dateTime.month-index;
    int newTimeYear = dateTime.year;
    while(newTimeMonth<=0){
      newTimeMonth+=12;
      newTimeYear-=1;
    }
    return DateTime(newTimeYear,newTimeMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Column(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: const Text(
                    "Money",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    moneyFormat(widget.appUser.currentMoney),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ]),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                onPressed: () {
                  print(widget.appUser.uid);
                },
              )
            ],
        ),
        body: Column(children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(180,50),
                    backgroundColor: index!=pageChanged? Colors.grey:const Color(0xFFF5F5F5),
                  ),
                  onPressed: () {
                    setState(() {
                      pageChanged=index;
                      pageController.animateToPage(pageChanged, duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
                    });
                  },
                  child: Text(
                    "${dateCount(date, index).month}/${dateCount(date, index).year}",
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          Expanded(
            child: PageView.builder(
              reverse: true,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageChanged = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return TransactionPageView(dateTime: dateCount(date, index), appUser: widget.appUser,);
              },
              itemCount: 10,
            ),
          ),
        ])
    );
  }
}


