import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Profile'),
            ),
            ListTile(
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
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
                            borderRadius: BorderRadius.circular(13),
                            image: const DecorationImage(
                                image: AssetImage("assets/living.jpg"),
                                fit: BoxFit.cover)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 100, 8, 0),
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
                            borderRadius: BorderRadius.circular(13),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/kitchen.jpg",
                                ),
                                fit: BoxFit.cover)),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 100, 8, 0),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 300, 0),
                child: Text(
                  "Devices",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
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
                            backgroundImage: AssetImage("assets/camer.jpg"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 0, 0),
                                child: Text(
                                  'Cameras',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
                                child: Text("6 Devices"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 0, 0),
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
                            backgroundImage: AssetImage("assets/light.jpg"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 0, 0),
                                child: Text(
                                  'Lights',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
                                child: Text("9 Devices"),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
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
                            backgroundImage: AssetImage("assets/speaker.jpg"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 0, 0),
                                child: Text(
                                  'Speaker',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
                                child: Text("2 Devices"),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 0, 0),
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
                            backgroundImage: AssetImage("assets/socke.jpg"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 0, 0),
                                child: Text(
                                  'sockets',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
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
                            backgroundImage: AssetImage("assets/sensor.jpg"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 0, 0),
                                child: Text(
                                  'Sensors',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
                                child: Text("2 Devices"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 0, 0),
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
                            backgroundImage: AssetImage("assets/ac.jpg"),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 0, 0),
                                child: Text(
                                  'Ac',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 300, 0),
                child: Text(
                  "Bedroom",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/bulb.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/table.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/light.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 3, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/speaker.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 3, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/socke.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 3, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/sensor.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 8, 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 3, 8, 8),
                      child: Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 233, 233),
                            borderRadius: BorderRadius.circular(13)),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/ac.jpg"),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
