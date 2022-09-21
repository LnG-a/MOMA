
import 'package:flutter/material.dart';

// class ProfilePic extends StatefulWidget {
//   const ProfilePic({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilePic> createState() => _ProfilePicState();
// }
//
// class _ProfilePicState extends State<ProfilePic> {
//   File? image= File('assets/images/21.png');
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 115,
//       width: 115,
//       child: Column(
//         // fit: StackFit.expand,
//         // clipBehavior: Clip.none,
//         children: [
//           // CircleAvatar(
//           //   backgroundColor: Colors.black45,
//           //   //child: Text("L",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w300),),
//           //   backgroundImage: AssetImage('assets/images/1.png'),
//           //   //backgroundImage: AssetImage('assets/images/1.png'),
//           //   //backgroundImage: NetworkImage("https://images.unsplash.com/photo-1651604033534-e66b281f1981?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
//           // ),
//           Spacer(),
//           image != null
//               ? ClipOval(
//               child: Image.file(
//                 image!,
//                 height: 500,
//                 )
//               )
//               : const SizedBox(
//             height: 100,),
//
//           // Positioned(
//           //   right: -16,
//           //   bottom: 0,
//           //   child: SizedBox(
//           //     height: 46,
//           //     width: 46,
//           //     child: TextButton(
//           //       style: TextButton.styleFrom(
//           //         shape: RoundedRectangleBorder(
//           //           borderRadius: BorderRadius.circular(50),
//           //           side: const BorderSide(color: Colors.white),
//           //         ),
//           //         primary: Colors.white,
//           //         backgroundColor: const Color(0xFFF5F6F9),
//           //       ),
//           //       onPressed: () {
//           //         pickImage();
//           //       },
//           //       child: const Icon(Icons.add_a_photo, color: Colors.black,),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
//
//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//
//       final imageTemporary = File(image.path);
//       setState(() => this.image = imageTemporary);
//     } on PlatformException catch (e) {
//       print(e.message);
//     }
//   }
// }


class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  String checkNull(String? text){
    if(text!= null) return text;
    return '/email_address/';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          // FutureBuilder(
          //   future: Provider
          //       .of(context)
          //       .auth
          //       .getCurrentUser(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return displayUserInformation(context, snapshot);
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
          const CircleAvatar(
            backgroundColor: Colors.black45,
            //child: Text("L",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w300),),
            //backgroundImage: NetworkImage(checkNull(FirebaseAuth.instance.currentUser!.photoURL)),
            backgroundImage: AssetImage('assets/images/1.png'),
            //backgroundImage: NetworkImage("https://images.unsplash.com/photo-1651604033534-e66b281f1981?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: const Icon(Icons.add_a_photo, color: Colors.black,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
