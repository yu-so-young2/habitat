import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitat/api/friends/api_friendcode.dart';
import 'package:habitat/api/friends/api_friendsList.dart';
import 'package:habitat/models/friends_list_model.dart';
import 'package:habitat/widgets/dock_bar.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  late var userCode = ApiFriendcode().getCode('asdf');

  onSubmitButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Friends 친구",
          style: TextStyle(
              color: Color(0xff002B20),
              fontSize: 28,
              fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FutureBuilder(
                            future: userCode,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                );
                              } else {
                                return const Text('없음');
                              }
                            }),
                        FutureBuilder(
                            future: userCode,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                        text: snapshot.data.toString()));
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Copied to clipboard'),
                                    ));
                                  },
                                  icon: const Icon(Icons.copy_rounded),
                                  iconSize: 20,
                                  alignment: AlignmentDirectional.centerEnd,
                                );
                              } else {
                                return const Text('X');
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '친구 코드를 입력하세요.', hintStyle: TextStyle()),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: onSubmitButton, child: const Text('확인')),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'lib/assets/images/kakao.png',
                        fit: BoxFit.cover,
                      ),
                      iconSize: 30,
                    )
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '친구신청 목록',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: 100,
                // width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.local_florist_rounded,
                        size: 50,
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "쏘영쏘",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "목표 음수량 : 1.5L",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('수락')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text('거절')),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '내 친구 목록',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              // ListView(

              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}

class friendslist extends StatelessWidget {
  String userKey, nickname, imgUrl, recent;
  friendslist({
    super.key,
    required this.userKey,
    required this.nickname,
    required this.imgUrl,
    required this.recent,
  });

  final Future<List<FriendsListModel>> friendslistdata =
      ApiFriendsList().getFriendsList('asdf');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: friendslistdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return friendslist(
                      userKey: snapshot.data![index].userKey,
                      nickname: snapshot.data![index].nickname,
                      imgUrl: snapshot.data![index].imgUrl,
                      recent: snapshot.data![index].recent);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: snapshot.data!.length);
          } else {
            return const SizedBox(
              height: 10,
            );
          }
        });
  }
}
