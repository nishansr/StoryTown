import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mid West & Gascoyne',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
              ),
            ),
            const Text(
              'SandStone',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Slider(value: 0, onChanged: (value) {}),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '00:00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 40,
                    )),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black,
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 35,
                        )),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next,
                      size: 45,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
