import 'package:cached_network_image/cached_network_image.dart';
import 'package:coders/widgets/utils/user_data.dart';
import 'package:coders/views/auth_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';
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
              height: MediaQuery.of(context).size.height * 0.19,
              child: Stack(
                children: [
                  blueIntroWidgetWithoutLogos(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder(
                        future: _loadPic(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            pic = snapshot.data!;

                            return InkWell(
                                onTap: () {},
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot.data!,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                            "assets/images/add-pic.png"),
                                    fit: BoxFit.cover,
                                    width: 130,
                                    height: 130,
                                  ),
                                ));
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: "Edit Profile",
              icon: Icons.person_2_outlined,
              press: () async {
                await Future.delayed(const Duration(milliseconds: 150));
                // Get.to(
                //     () => Profile(
                //           nameController: nameController,
                //           emailController: emailController,
                //           phoneController: phoneController,
                //           aboutController: aboutController,
                //           currentCountry: currentCountry,
                //           currentCity: currentCity,
                //           currentState: currentState,
                //           pic: pic,
                //         ),
                //     transition: Transition.fadeIn);
              },
            ),
            ProfileMenu(
              text: "Feedback",
              icon: Icons.feedback_outlined,
              press: () => {},
            ),
            ProfileMenu(
              text: "Exit demand",
              icon: Icons.report_problem_outlined,
              press: () => {},
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

  Widget blueIntroWidgetWithoutLogos() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Ellipse.png'),
              fit: BoxFit.fill)),
      height: MediaQuery.of(context).size.height * 0.12,
    );
  }
}
