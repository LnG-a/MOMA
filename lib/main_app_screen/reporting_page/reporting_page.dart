import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/main_app_screen/reporting_page/reporting_page_view.dart';

class ReportingPage extends StatefulWidget {
  MomaUser appUser;

  ReportingPage({Key? key,required this.appUser}) : super(key: key);

  @override
  State<ReportingPage> createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage> {
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: (const Text(
              "Reporting", style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold))),
        ),
        body:Column(children: [
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
                return ReportingPageView(appUser: widget.appUser, dateTime: dateCount(date, index));
              },
              itemCount: 10,
            ),
          ),
        ])
    );
  }
}

