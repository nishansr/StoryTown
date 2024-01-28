import 'package:chat_app/tabs/chat_tab.dart';
import 'package:chat_app/tabs/main_tab.dart';
import 'package:chat_app/tabs/map_tab.dart';
import 'package:chat_app/tabs/music_list.dart';
import 'package:chat_app/tabs/music_player_tab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int _currentIndex = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      const HomeTab(),
      const MapPage(),
      const MusicPlayer(),
      const MusicList(),
      const Chat(),
    ];
    return Scaffold(
      body: widgetList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add),
            label: 'Music List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
