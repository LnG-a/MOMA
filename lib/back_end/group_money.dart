

import 'package:flutter/cupertino.dart';

const String INCOME = "INCOME";
const String OUTCOME = "OUTCOME";
const double ICON_SIZE =32;

const int UNDEFINED          = 0;
const int FOOD               = 1;
const int GASOLINE_EXPENSES  = 2;
const int RENT               = 3;
const int HOSPITAL           = 4;
const int EDUCATION          = 5;
const int PETS               = 6;
const int ENTERTAINMENT      = 7;
const int SPORTS             = 8;
const int BILLS              = 9;
const int INVESTMENT         = 10;
const int SALARY             = 11;
const int OTHER_INCOME       = 12;

class GroupMoney {
  late String name;
  late String type;
  late Image icon;

  GroupMoney(String _name, String _type,Image _icon){
    name=_name;
    type=_type;
    icon=_icon;
  }
}

List<GroupMoney> groupMoneyList=[
  GroupMoney("Pick a money group",INCOME,Image.asset("assets/images/undefined.png",width: 32,height: 32)),
  GroupMoney("Food&Drink",OUTCOME,Image.asset("assets/images/food.png",width: 32,height: 32,)),
  GroupMoney("Gasoline Expenses",OUTCOME,Image.asset("assets/images/move.png",width: 32,height: 32,)),
  GroupMoney("Rent",OUTCOME,Image.asset("assets/images/rent.png",width: 32,height: 32)),
  GroupMoney("Hospital",OUTCOME,Image.asset("assets/images/hospital.png",width: 32,height: 32)),
  GroupMoney("Education",OUTCOME,Image.asset("assets/images/education.png",width: 32,height: 32)),
  GroupMoney("Pets",OUTCOME,Image.asset("assets/images/pets.png",width: 32,height: 32)),
  GroupMoney("Entertainment",OUTCOME,Image.asset("assets/images/entertainment.png",width: 32,height: 32)),
  GroupMoney("Sports",OUTCOME,Image.asset("assets/images/sports.png",width: 32,height: 32)),
  GroupMoney("Bills",OUTCOME,Image.asset("assets/images/bills.png",width: 32,height: 32)),
  GroupMoney("Investment",OUTCOME,Image.asset("assets/images/investment.png",width: 32,height: 32)),
  GroupMoney("Salary",INCOME,Image.asset("assets/images/salary.png",width: 32,height: 32)),
  GroupMoney("Other income",INCOME,Image.asset("assets/images/otherIncome.png",width: 32,height: 32))
];




