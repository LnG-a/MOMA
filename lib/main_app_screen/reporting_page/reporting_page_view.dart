import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moma/back_end/group_money.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/back_end/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportingPageView extends StatefulWidget {
  DateTime dateTime;
  MomaUser appUser;
  late List<Transaction> transactionsByMonth = transactionByMonth();

  ReportingPageView({Key? key, required this.dateTime, required this.appUser})
      : super(key: key);

  @override
  State<ReportingPageView> createState() =>
      _ReportingPageViewState(transactionsByMonth);

  List<Transaction> transactionByMonth() {
    List<Transaction> newList = List<Transaction>.from(appUser.transactions);
    for (int i = 0; i < newList.length; i++) {
      if (newList[i].time.month != dateTime.month ||
          newList[i].time.year != dateTime.year) {
        newList.removeAt(i);
        i--;
      }
    }
    return newList;
  }
}

class _ReportingPageViewState extends State<ReportingPageView> {
  List<Transaction> transactionsByMonth;
  late List<TransactionChartData> _charOutcomeData;
  late List<TransactionChartData> _charIncomeData;
  late List<FullChartData> _charFullData;
  late TooltipBehavior _tooltipBehavior;

  _ReportingPageViewState(this.transactionsByMonth);

  @override
  void initState() {
    // TODO: implement initState
    _charOutcomeData = getOutcomeData();
    _charIncomeData = getIncomeData();
    _charFullData = getFullData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 500,
        child: SfCircularChart(
          title: ChartTitle(text: "Outcomes data"),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<TransactionChartData, String>(
              dataSource: _charOutcomeData,
              xValueMapper: (TransactionChartData data, _) =>
                  groupMoneyList[data.groupMoney].name,
              yValueMapper: (TransactionChartData data, _) => data.total,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                borderRadius: 5,
                color: Colors.black,
              ),
              enableTooltip: true,
            )
          ],
        ),
      ),
      Container(
        height: 500,
        child: SfCircularChart(
          title: ChartTitle(text: "Incomes data"),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<TransactionChartData, String>(
              dataSource: _charIncomeData,
              xValueMapper: (TransactionChartData data, _) =>
                  groupMoneyList[data.groupMoney].name,
              yValueMapper: (TransactionChartData data, _) => data.total,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                borderRadius: 5,
                color: Colors.black,
              ),
              enableTooltip: true,
            )
          ],
        ),
      ),
      Container(
          height: 500,
          child: SfCircularChart(
            title: ChartTitle(text: "Transaction data"),
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              PieSeries<FullChartData, String>(
                dataSource: _charFullData,
                xValueMapper: (FullChartData data, _) =>
                    data.type,
                yValueMapper: (FullChartData data, _) => data.total,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  borderRadius: 5,
                  color: Colors.black,
                ),
                enableTooltip: true,
              )
            ],
          ))
    ]);
  }

  List<FullChartData> getFullData() {
    List<FullChartData> chartData = [];

    chartData.add(FullChartData(OUTCOME, 0));
    chartData.add(FullChartData(INCOME, 0));

    for (int i = 0; i < transactionsByMonth.length; i++) {
      if(groupMoneyList[transactionsByMonth[i].group_money].type==OUTCOME) {
        chartData[0].total+=transactionsByMonth[i].money;
      } else {
        chartData[1].total+=transactionsByMonth[i].money;
      }
    }

    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i].total == 0) {
        chartData.removeAt(i);
        i--;
      }
    }

    return chartData;
  }

  List<TransactionChartData> getOutcomeData() {
    List<TransactionChartData> chartData = [];

    for (int i = 1; i < groupMoneyList.length - 2; i++) {
      chartData.add(TransactionChartData(i, 0));
    }

    for (int i = 0; i < transactionsByMonth.length; i++) {
      if (transactionsByMonth[i].group_money == OTHER_INCOME ||
          transactionsByMonth[i].group_money == SALARY) {
        continue;
      }
      for (int j = 0; j < chartData.length; j++) {
        if (chartData[j].groupMoney == transactionsByMonth[i].group_money) {
          chartData[j].total += transactionsByMonth[i].money;
          break;
        }
      }
    }

    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i].total == 0) {
        chartData.removeAt(i);
        i--;
      }
    }

    return chartData;
  }

  List<TransactionChartData> getIncomeData() {
    List<TransactionChartData> chartData = [];

    chartData.add(TransactionChartData(SALARY, 0));
    chartData.add(TransactionChartData(OTHER_INCOME, 0));

    for (int i = 0; i < transactionsByMonth.length; i++) {
      if (transactionsByMonth[i].group_money != OTHER_INCOME &&
          transactionsByMonth[i].group_money != SALARY) {
        continue;
      }
      for (int j = 0; j < chartData.length; j++) {
        if (chartData[j].groupMoney == transactionsByMonth[i].group_money) {
          chartData[j].total += transactionsByMonth[i].money;
          break;
        }
      }
    }

    for (int i = 0; i < chartData.length; i++) {
      if (chartData[i].total == 0) chartData.removeAt(i--);
    }

    return chartData;
  }
}

class FullChartData{
  FullChartData(this.type,this.total);

  String type;
  int total;
}

class TransactionChartData {
  TransactionChartData(this.groupMoney, this.total);

  int groupMoney;
  int total;
}
