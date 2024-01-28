import 'dart:async';

import 'package:chat_app/pages/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/chat_screen.dart';
import 'package:chat_app/service/database.dart';
import 'package:chat_app/service/shared_pref.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool search = false;
  String? myName, myProfilePic, myUserName, myEmail;
  Stream? chatRoomsStream;

  getthesharedpref() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserPic();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    chatRoomsStream = await DatabaseMethods().getChatRooms();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    ontheload();
  }

  getChatRoomIdbyUsername(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    setState(() {
      search = true;
    });
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().Search(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      for (var element in queryResultSet) {
        if (element['username'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF553370),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 35.0,
                  left: 18.0,
                  right: 18.0,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    search
                        ? Expanded(
                            child: TextField(
                            onChanged: (value) {
                              initiateSearch(value.toUpperCase());
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search User',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                        : Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ProfileScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.manage_accounts_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "StoryTown",
                                style: TextStyle(
                                  color: Color(0Xffc199cd),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                    GestureDetector(
                      onTap: () {
                        search = true;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: const Color(0xFF3a2144),
                            borderRadius: BorderRadius.circular(20)),
                        child: search
                            ? GestureDetector(
                                onTap: () {
                                  search = false;
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Color(0Xffc199cd),
                                ),
                              )
                            : const Icon(
                                Icons.search,
                                color: Color(0Xffc199cd),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                height: search
                    ? MediaQuery.of(context).size.height / 1.19
                    : MediaQuery.of(context).size.height / 1.15,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: search
                    ? ListView(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        primary: false,
                        shrinkWrap: true,
                        children: tempSearchStore.map((element) {
                          return buildResultCard(element);
                        }).toList())
                    :
                    //! Home Screen
                    SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/living.jpg"),
                                              fit: BoxFit.cover)),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 100, 8, 0),
                                        child: Text(
                                          "Living Room",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                "assets/kitchen.jpg",
                                              ),
                                              fit: BoxFit.cover)),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 100, 8, 0),
                                        child: Text(
                                          "Kitchen",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Devices",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                            AssetImage("assets/camer.jpg"),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8, 18, 0, 0),
                                            child: Text(
                                              'Cameras',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 4, 0, 0),
                                            child: Text("6 Devices"),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                            AssetImage("assets/light.jpg"),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8, 18, 0, 0),
                                            child: Text(
                                              'Lights',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 4, 0, 0),
                                            child: Text("9 Devices"),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                            AssetImage("assets/speaker.jpg"),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8, 18, 0, 0),
                                            child: Text(
                                              'Speaker',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 4, 0, 0),
                                            child: Text("2 Devices"),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 8, 0, 0),
                                  child: Container(
                                    height: 80,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 28,
                                          backgroundImage:
                                              AssetImage("assets/socke.jpg"),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 18, 0, 0),
                                              child: Text(
                                                'sockets',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 4, 0, 0),
                                              child: Text("5 Devices"),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage:
                                            AssetImage("assets/sensor.jpg"),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8, 18, 0, 0),
                                            child: Text(
                                              'Sensors',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 4, 0, 0),
                                            child: Text("2 Devices"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 8, 0, 0),
                                  child: Container(
                                    height: 80,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 28,
                                          backgroundImage:
                                              AssetImage("assets/ac.jpg"),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 18, 0, 0),
                                              child: Text(
                                                'Ac',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 4, 0, 0),
                                              child: Text("2 Devices"),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Bedroom",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 200,
                              width: 340,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(13),
                                image: const DecorationImage(
                                  image: AssetImage("assets/bedroom.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 245, 233, 233),
                                      borderRadius: BorderRadius.circular(13)),
                                  child: const Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 8, 0, 0),
                                            child: CircleAvatar(
                                              radius: 19,
                                              backgroundImage:
                                                  AssetImage("assets/bulb.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 8, 0, 0),
                                            child: Text(
                                              "50%",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Main Light',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 90,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 247, 233, 233),
                                      borderRadius: BorderRadius.circular(13)),
                                  child: const Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(8, 8, 0, 0),
                                            child: CircleAvatar(
                                              radius: 19,
                                              backgroundImage: AssetImage(
                                                  "assets/table.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                15, 8, 0, 0),
                                            child: Text(
                                              "Off",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Table Lamp',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 8, 8),
                                  child: Container(
                                    height: 90,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 247, 233, 233),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 0, 0),
                                              child: CircleAvatar(
                                                radius: 19,
                                                backgroundImage: AssetImage(
                                                    "assets/light.jpg"),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 8, 0, 0),
                                              child: Text(
                                                "Off",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Floor Lamp',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 247, 233, 233),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: const Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 19,
                                              backgroundImage: AssetImage(
                                                  "assets/speaker.jpg"),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 8, 0, 0),
                                              child: Text(
                                                "50%",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Speaker',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 247, 233, 233),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 0, 0),
                                              child: CircleAvatar(
                                                radius: 19,
                                                backgroundImage: AssetImage(
                                                    "assets/socke.jpg"),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 8, 0, 0),
                                              child: Text(
                                                "Off",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Socket',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 247, 233, 233),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 0, 0),
                                              child: CircleAvatar(
                                                radius: 19,
                                                backgroundImage: AssetImage(
                                                    "assets/sensor.jpg"),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 8, 0, 0),
                                              child: Text(
                                                "On",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Sensor',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 3, 8, 8),
                                  child: Container(
                                    height: 90,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 247, 233, 233),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 8, 0, 0),
                                              child: CircleAvatar(
                                                radius: 19,
                                                backgroundImage:
                                                    AssetImage("assets/ac.jpg"),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 8, 0, 0),
                                              child: Text(
                                                "25 ",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Ac',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResultCard(data) {
    return GestureDetector(
      onTap: () async {
        search = false;

        var chatRoomId = getChatRoomIdbyUsername(myUserName!, data["username"]);
        Map<String, dynamic> chatRoomInfoMap = {
          "users": [myUserName, data["username"]],
        };
        await DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              name: data["Name"],
              profileurl: data["Photo"],
              username: data["username"],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    data['Photo'],
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["Name"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      data["username"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
