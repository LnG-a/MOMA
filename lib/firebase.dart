import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moma/back_end/group_money.dart';
import 'package:moma/back_end/moma_user.dart';

class DatabaseManager {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future<void> userSetup(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    MomaUser appUser = MomaUser(email);
    appUser.uid = auth.currentUser!.uid.toString();
    users.add({
      'email': email, 'uid': appUser.uid,
      'current money': appUser.currentMoney,
      'Max Transaction ID': appUser.MAX_ID,
      //'Group money': groupMoneyList[FOOD]
    });
    return;
  }
}

// Future updateTransaction(List<Transaction> transactions, String uid) async{
//   return await users.doc(uid).update({'Transactions':transactions});
// }
