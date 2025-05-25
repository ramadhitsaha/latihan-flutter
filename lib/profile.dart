import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("NIM: 23SA11A050"),
            Text("Nama: Rama Dhitsaha Setya Negara"),
            Text("Kelas: IF23B"),
          ],
        ),
      ),
    );
  }
}
