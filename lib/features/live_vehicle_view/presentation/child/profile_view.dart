import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              CircleAvatar(
                child: ClipOval(
                  child: Icon(Icons.person),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}