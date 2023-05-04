// import 'package:flutter/material.dart';
// import 'package:habitat/api/friends/api_friendrequest.dart';
// import 'package:habitat/api/friends/api_friendsList.dart';
// import 'package:habitat/models/friend_request_model.dart';
// import 'package:habitat/models/friends_list_model.dart';

// class friendslistWidget extends StatelessWidget {
//   final Future<List<FriendsListModel>> friendslistdata =
//       ApiFriendsList().getFriendsList('asdf');


//   final ScrollController controller;
//   void test() {
//     debugPrint(friendslistdata.toString());
//   }

//   friendslistWidget({
//     super.key,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: friendslistdata,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data != null) {
//             return ListView.separated(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 controller: controller,
//                 itemBuilder: (context, index) {
//                   debugPrint("asdasdasd");
//                   debugPrint(snapshot.data![index].toString());
//                   return friendslist(
//                       userKey: snapshot.data![index].userKey,
//                       nickname: snapshot.data![index].nickname,
//                       imgUrl: snapshot.data![index].imgUrl,
//                       recent: snapshot.data![index].recent);
//                 },
//                 separatorBuilder: (context, index) => const SizedBox(
//                       height: 10,
//                     ),
//                 itemCount: snapshot.data!.length);
//           } else {
//             return const SizedBox(
//               height: 10,
//             );
//           }
//         });
//   }
// }

// class friendsRequestlistWidget extends StatelessWidget {

//   final Future<List<FriendRequestModel>> friendrequestlist =
//       ApiFriendRequestList().getRequestFriendList('asdf');

//   final ScrollController controller;

//   friendsRequestlistWidget({super.key,
//   });



//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: friendrequestlist,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data != null) {
//             return ListView.separated(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 controller: controller,
//                 itemBuilder: (context, index) {
//                   debugPrint("asdasdasd");
//                   debugPrint(snapshot.data![index].toString());
//                   return friendslist(
//                       userKey: snapshot.data![index].userKey,
//                       nickname: snapshot.data![index].nickname,
//                       imgUrl: snapshot.data![index].imgUrl,
//                       recent: snapshot.data![index].recent);
//                 },
//                 separatorBuilder: (context, index) => const SizedBox(
//                       height: 10,
//                     ),
//                 itemCount: snapshot.data!.length);
//           } else {
//             return const SizedBox(
//               height: 10,
//             );
//           }
//         });
//   }
// }

// class friendslist extends StatelessWidget {
//   final String userKey, nickname, imgUrl, recent;
//   const friendslist({
//     super.key,
//     required this.userKey,
//     required this.nickname,
//     required this.imgUrl,
//     required this.recent,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.black,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(12)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: imgUrl != ''
//                 ? Image.network(
//                     imgUrl,
//                     scale: 5,
//                   )
//                 : const Icon(
//                     Icons.local_florist_rounded,
//                     size: 50,
//                   ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 nickname,
//                 style: const TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Text(
//                 recent,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.add_alert_outlined),
//             iconSize: 30,
//           )
//         ],
//       ),
//     );
//   }
// }

// class requestfriendlist extends StatelessWidget {
//   final int friendRequestKey;
//   final String userKey, nickname, imgUrl;
//   const requestfriendlist({
//     super.key,
//     required this.friendRequestKey,
//     required this.userKey,
//     required this.nickname,
//     required this.imgUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.black,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(12)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: imgUrl != ''
//                 ? Image.network(
//                     imgUrl,
//                     scale: 5,
//                   )
//                 : const Icon(
//                     Icons.local_florist_rounded,
//                     size: 50,
//                   ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 nickname,
//                 style: const TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(3),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child:
//                       ElevatedButton(onPressed: () {}, child: const Text('수락')),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child:
//                       ElevatedButton(onPressed: () {}, child: const Text('거절')),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
