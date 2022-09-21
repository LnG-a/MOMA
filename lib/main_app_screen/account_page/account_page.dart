
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moma/back_end/moma_user.dart';
import 'package:moma/login_screen/login_screen.dart';
import 'package:moma/main_app_screen/account_page/profile_menu.dart';
import 'package:moma/main_app_screen/account_page/profile_pic.dart';

final FirebaseAuth auth= FirebaseAuth.instance;


class AccountPage extends StatefulWidget {
  MomaUser appUser;

  AccountPage({Key? key,required this.appUser}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool check=auth.currentUser?.email!=null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 15),
          Text(check? checkNull(auth.currentUser?.email):"/email_address/"),
          //Text(checkNull(FirebaseAuth.instance.currentUser!.email)),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: const Icon(Icons.person),
            press: () => {
              setState((){
                check =(auth.currentUser?.email!=null);
              }),
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: const Icon(Icons.notifications),
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: const Icon(Icons.settings),
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: const Icon(Icons.help_outline),
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: const Icon(Icons.logout,color: Colors.black),
            press: () {_logout();},
          ),
        ],
      ),
    );
  }

  String checkNull(String? text){
    if(text!= null) return text;
    return '/email_address/';
  }

  void _logout() {
    auth.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage(appUser: widget.appUser,)));
  }
}
