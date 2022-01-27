import 'package:pos_app/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<ProfileController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
          ),
          body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("user")
                .doc(AppSession.userCredential.user.uid)
                .snapshots(),
            builder: (context, stream) {
              if (stream.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (stream.hasError) {
                return Center(child: Text(stream.error.toString()));
              }

              DocumentSnapshot documentSnapshot = stream.data;
              var item = documentSnapshot.data()["profile"];
              print(item);

              return Padding(
                padding: theme.mediumPadding,
                child: Column(
                  children: [
                    if (item["photoURL"] != null)
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                          item["photoURL"],
                        ),
                      ),
                    if (item["photoURL"] == null)
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: theme.primary,
                        child: Text(
                          item["displayName"] != null
                              ? item["displayName"][0]
                              : "G",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ExTextField(
                      id: "full_name",
                      label: "Full Name",
                      hintText: "Your full name",
                      enabled: false,
                      value: item["displayName"] ?? "Guest",
                    ),
                    ExTextField(
                      id: "email",
                      label: "Email",
                      hintText: "Your email",
                      enabled: false,
                      value: item["email"] ?? "guest@world.com",
                    ),
                    Spacer(),
                    ExButton(
                      label: "Logout",
                      height: 40.0,
                      color: theme.primary,
                      onPressed: () => controller.doLogout(),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
