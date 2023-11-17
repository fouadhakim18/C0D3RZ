import 'package:cached_network_image/cached_network_image.dart';
import 'package:coders/views/settings/edit_profile.dart';
import 'package:coders/views/settings/exit_demand.dart';
import 'package:coders/widgets/utils/user_data.dart';
import 'package:coders/views/auth_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';
import '../../widgets/intro_widget.dart';
import 'profile.dart';
import 'profile_menu.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();

  String? currentCountry;
  String? currentState;
  String? currentCity;
  String? pic;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userData = await UserData().getUserData();
    nameController.text = userData.get('name');
    emailController.text = userData.get('email');
    // phoneController.text = userData.get('Phone');
    // aboutController.text = userData.get('AboutEmployee') ?? "";
  }

  Future<String> _loadPic() async {
    final userData = await UserData().getUserData();
    // pic = userData.get("Pic");
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap: () {}, child: const SizedBox()),
          backgroundColor: AppColors.mainGreen,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.135,
              child: Stack(
                children: [
                  blueIntroWidgetWithoutLogos(context),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                          onTap: () {},
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/add-pic.png",
                              width: 100,
                            ),
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: "View Profile",
              icon: Icons.person_2_outlined,
              press: () async {
                await Future.delayed(const Duration(milliseconds: 150));
                Get.to(() => ProfilePage());
              },
            ),
            ProfileMenu(
              text: "Edit Profile",
              icon: Icons.person_2_outlined,
              press: () async {
                await Future.delayed(const Duration(milliseconds: 150));
              Get.to(()=> EditProfile());
              },
            ),
            ProfileMenu(
              text: "Feedback / Problems",
              icon: Icons.feedback_outlined,
              press: () => {_showFeedbackDialog(context)},
            ),
            ProfileMenu(
              text: "Exit demand",
              icon: Icons.report_problem_outlined,
              press: () => {Get.to(() => ExitDemand())},
            ),
            ProfileMenu(
              text: "About App",
              icon: Icons.info_outline,
              press: () => {},
            ),
            ProfileMenu(
                text: "Log Out",
                icon: Icons.logout_outlined,
                color: AppColors.redColor,
                press: () => signOut()),
          ],
        )));
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      Get.to(() => const LoginScreen());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _showFeedbackDialog(BuildContext context) async {
    TextEditingController feedbackController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter Your Feedback',
            style: TextStyle(fontSize: 16),
          ),
          content: TextField(
            controller: feedbackController,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Type your feedback here...',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Feedback: ${feedbackController.text}');
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
