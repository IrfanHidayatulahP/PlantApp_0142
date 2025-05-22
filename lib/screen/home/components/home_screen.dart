import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/screen/home/components/body.dart';
import 'package:plant_app/screen/home/components/mybottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key, 
    required this.alamat
  });

  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(alamat: alamat),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}