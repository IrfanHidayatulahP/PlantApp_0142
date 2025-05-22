import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/components/featured_plant.dart';
import 'package:plant_app/screen/home/components/header_with_searchbox.dart';
import 'package:plant_app/screen/home/components/recomen_plants.dart';
import 'package:plant_app/screen/home/components/title_with_morebtn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          HeaderWithSearchbox(size: size),
          TitleWithModeBtn(title: "Recomended", press: () {}),
          RecomendsPlants(),
          TitleWithModeBtn(title: "Featured Plant", press: () {}),
          FeaturedPlant(),
          SizedBox(height: kDefaultPadding,)
        ],
      ),
    );
  }
}