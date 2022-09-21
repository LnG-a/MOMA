
import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/main_app_screen/planning_menu/planning_menu.dart';

class PlanningPage extends StatefulWidget {
  MomaUser appUser;

  PlanningPage({Key? key, required this.appUser}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: (const Text(
              "Planning", style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold))),
        ),
        body: Column(
            children: [
              PlanningMenu(
                text: "Budget",
                subtext:"A financial plan help you balancing outcomes and incomes",
                icon: const Icon(Icons.savings),
                press: () {},
              ),
              PlanningMenu(
                text: "Event",
                subtext:"Create an event in this app to track your expense for a real event. For instance, a traveling tour",
                icon: const Icon(Icons.calendar_today_outlined),
                press: () {},
              ),
            ]
        )
    );
  }
}