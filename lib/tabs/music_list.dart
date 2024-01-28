import 'package:flutter/material.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = [
      {'name': 'Shape of You', 'singer': 'Ed Sheeran'},
      {'name': 'Blinding Lights', 'singer': 'The Weeknd'},
      {'name': 'Dance Monkey', 'singer': 'Tones and I'},
      {'name': 'Someone You Loved', 'singer': 'Lewis Capaldi'},
      {'name': 'Watermelon Sugar', 'singer': 'Harry Styles'},
      {'name': 'Levitating', 'singer': 'Dua Lipa'},
      {'name': 'Peaches', 'singer': 'Justin Bieber ft. Daniel Caesar, Giveon'},
      {'name': 'Save Your Tears', 'singer': 'The Weeknd'},
      {'name': 'Montero (Call Me By Your Name)', 'singer': 'Lil Nas X'},
      {'name': 'Good 4 U', 'singer': 'Olivia Rodrigo'},
      {
        'name': 'Leave The Door Open',
        'singer': 'Silk Sonic (Bruno Mars, Anderson .Paak)'
      },
      {'name': 'Kiss Me More', 'singer': 'Doja Cat ft. SZA'},
      {'name': 'Deja Vu', 'singer': 'Olivia Rodrigo'},
      {'name': 'Butter', 'singer': 'BTS'},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Music List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index]['name']!),
            subtitle: Text(
              songs[index]['singer']!,
            ),
            trailing: const Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}
