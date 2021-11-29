import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share/share.dart';

import '../../core.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kThirdColor,
      child: GetBuilder<ProfileController>(
        initState: (_) => controller.loadData(),
        builder: (_) => Stack(
          children: [
            Container(
              color: kAppBarBackgroundColor,
              height: 100,
            ),
            SafeArea(
              child: Container(
                decoration: BoxDecoration(color: kThirdColor),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildHeader(),
                      buildBody(),
                      buildActionButton(),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: kAppBarBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            AvatarWidget(
              photoURL:
                  "https://instagram.fopo5-2.fna.fbcdn.net/v/t51.2885-19/s150x150/257798171_1080393906046483_514592159066259995_n.jpg?_nc_ht=instagram.fopo5-2.fna.fbcdn.net&_nc_cat=107&_nc_ohc=XpJZ5oFBnKwAX8aWip-&tn=LpaskIcctZVHq7Jq&edm=ABfd0MgBAAAA&ccb=7-4&oh=d820268936bdf459c517be8f84d87129&oe=61A38526&_nc_sid=7bff83",
              membership: controller.userProfile.membership,
              progress: controller.userProfile.progress,
              heroTag: "profile",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.7),
                      child: Text(
                        controller.userProfile.fullName,
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 1.7),
                    //   child: Row(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 5.0),
                    //         child: Icon(
                    //           LineIcons.wallet,
                    //           color: Colors.white,
                    //           size: 22,
                    //         ),
                    //       ),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 2),
                    //       child: Text(
                    //         "IDR",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 16,
                    //             color: Colors.grey),
                    //       ),
                    //     ),
                    //     Text(
                    //       controller.userProfile.balance,
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
              child: Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Colors.grey[300],
                    width: 1,
                  ),
                ),
                child: Icon(
                  LineIcons.userEdit,
                  color: Colors.white,
                  size: 29,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              color: kSecondColor, borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              ItemListMenu(
                icon: LineIcons.envelope,
                name: "Email",
                data: controller.userProfile.email,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              color: kSecondColor, borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              ItemListMenu(
                onPressed: () => Share.share(
                    'Please Buy this Template :\nhttps://codecanyon.net/item/aqua-workout-fitness-app-v10-flutter-ui-kit-using-getx/31921400'),
                icon: LineIcons.gift,
                name: "Invite Friends",
              ),
              const Divider(),
              ItemListMenu(
                onPressed: () => OpenDialog.info(
                    lottieFilename: LottieFileName.COMING_SOON,
                    lottiePadding: EdgeInsets.only(top: 50)),
                icon: LineIcons.cog,
                name: "Settings",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          OpenDialog.confirm(
            content: "Are you sure to sign out?",
            lottieFilename: "thinking",
            onYesClicked: () => Get.offAllNamed(Routes.LOGIN),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red[300],
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0.2,
          textStyle: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: Icon(
          LineIcons.alternateSignOut,
          size: 27,
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}
