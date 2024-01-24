import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:chat_app/pages/home_screen.dart';
import 'package:chat_app/pages/sign_in.dart';
import 'package:chat_app/service/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? myName, myProfilePic, myUserName, myEmail, myUserId;

  final currentUser = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection('users');

  getthesharedpref() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getUserPic();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myUserId = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  String? newName;
  String? newUserName;
  // ignore: unused_field
  File? _image;

  //edit profile pic
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage(String filePath) async {
    final storage = FirebaseStorage.instance;
    final reference =
        storage.ref().child('profile_images').child('user_id.jpg');

    final uploadTask = reference.putFile(File(filePath));
    final snapshot = await uploadTask.whenComplete(() {});

    // Get the download URL
    final downloadURL = await snapshot.ref.getDownloadURL();

    // Save the download URL to Firestore
    _updateProfileImage(downloadURL);
  }

  Future<void> _updateProfileImage(String imageUrl) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myUserId)
          .update({
        'Photo': imageUrl,
      });
      await SharedPreferenceHelper().saveUserPic(imageUrl);
      setState(() {
        ontheload();
      });
    }
  }

  // edit name
  Future<void> editName() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                newName = value;
              });
            },
            decoration: const InputDecoration(hintText: "Enter your name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                Navigator.of(context).pop();
                await SharedPreferenceHelper().saveUserDisplayName(newName!);
                if (newName!.trim().isNotEmpty) {
                  await userCollection.doc(myUserId).update({'Name': newName});
                }
                setState(() {
                  ontheload();
                });
              },
            ),
          ],
        );
      },
    );
  }

  // edit username
  Future<void> editUserName() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                newUserName = value;
              });
            },
            decoration: const InputDecoration(hintText: "Enter your name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                Navigator.of(context).pop();
                await SharedPreferenceHelper().saveUserName(newUserName!);
                if (newUserName!.trim().isNotEmpty) {
                  await userCollection.doc(myUserId).update(
                    {'username': newUserName},
                  );
                  await userCollection.doc(myUserId).update(
                    {
                      'SearchKey': newUserName!.substring(0, 1).toUpperCase(),
                    },
                  );
                }
                setState(() {
                  ontheload();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 50.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const Home(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _pickImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(myProfilePic!),
              ),
            ),
            Text(
              myName!,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              myUserName!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 10),

            //!
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              margin: const EdgeInsets.only(left: 20, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          editName();
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newName ?? myName!,
                        style: const TextStyle(
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              margin: const EdgeInsets.only(left: 20, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          editUserName();
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newUserName ?? myUserName!,
                        style: const TextStyle(
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () async {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    await auth.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignIn(),
                      ),
                    );
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
